{{- define "sms.fullname" -}}
{{ .Release.Name }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "sms.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "sms.labels" -}}
app: {{ .Values.appName }}
release: {{ .Release.Name }}
helm.sh/chart: {{ include "sms.chart" . }}
{{ include "sms.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "sms.selectorLabels" -}}
app.kubernetes.io/name: {{ include "sms.fullname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}



