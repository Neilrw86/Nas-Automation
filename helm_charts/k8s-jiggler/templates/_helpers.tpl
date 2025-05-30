{{/*
Expand the name of the chart.
*/}}
{{- define "k8s-jiggler.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If DNS name is longer than 63 chars, we truncate it on the right.
*/}}
{{- define "k8s-jiggler.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "k8s-jiggler.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "k8s-jiggler.labels" -}}
helm.sh/chart: {{ include "k8s-jiggler.chart" . }}
{{ include "k8s-jiggler.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "k8s-jiggler.selectorLabels" -}}
app.kubernetes.io/name: {{ include "k8s-jiggler.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "k8s-jiggler.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
{{- default (include "k8s-jiggler.fullname" .) .Values.serviceAccount.name -}}
{{- else -}}
{{- default "default" .Values.serviceAccount.name -}}
{{- end -}}
{{- end -}}

{{/*
Return the appropriate API version for RBAC resources.
*/}}
{{- define "k8s-jiggler.rbac.apiVersion" -}}
{{- if .Capabilities.APIVersions.Has "rbac.authorization.k8s.io/v1" -}}
rbac.authorization.k8s.io/v1
{{- else -}}
rbac.authorization.k8s.io/v1beta1
{{- end -}}
{{- end -}}

{{/*
Determine the namespace for RBAC Role and RoleBinding if not cluster-scoped.
If jiggler.namespace is set and rbac.clusterScoped is false, use jiggler.namespace.
Otherwise (if jiggler.namespace is not set or rbac.clusterScoped is true), use the release namespace for the Role/RoleBinding.
This ensures the Role is created in the namespace the jiggler is intended to watch if specified.
*/}}
{{- define "k8s-jiggler.rbac.namespace" -}}
{{- if and .Values.jiggler.namespace (not .Values.rbac.clusterScoped) -}}
{{- .Values.jiggler.namespace -}}
{{- else -}}
{{- .Release.Namespace -}}
{{- end -}}
{{- end -}}
