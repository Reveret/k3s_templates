{{- define "database-with-backup.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "database-with-backup.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name (include "database-with-backup.name" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{- define "database-with-backup.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" -}}
{{- end -}}

{{- define "database-with-backup.labels" -}}
helm.sh/chart: {{ include "database-with-backup.chart" . }}
app.kubernetes.io/name: {{ include "database-with-backup.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{- define "database-with-backup.selectorLabels" -}}
app.kubernetes.io/name: {{ include "database-with-backup.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{- define "database-with-backup.secretName" -}}
{{- if .Values.auth.existingSecret -}}
{{- .Values.auth.existingSecret -}}
{{- else -}}
{{- printf "%s-auth" (include "database-with-backup.fullname" .) -}}
{{- end -}}
{{- end -}}

{{- define "database-with-backup.configMapName" -}}
{{- printf "%s-config" (include "database-with-backup.fullname" .) -}}
{{- end -}}

{{- define "database-with-backup.pvcName" -}}
{{- if .Values.persistence.existingClaim -}}
{{- .Values.persistence.existingClaim -}}
{{- else -}}
{{- printf "%s-data" (include "database-with-backup.fullname" .) -}}
{{- end -}}
{{- end -}}
