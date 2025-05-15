{{/* vim: set filetype=mustache: */}}
{{/*
Determine the name depending on whether or not to use the release name.
*/}}
{{- define "otds.name" -}}
{{- if eq .Values.global.otdsUseReleaseName true }}
{{- printf "%s-%s" .Release.Name .Chart.Name -}}
{{- else }}
{{- printf "%s" .Chart.Name -}}
{{- end }}
{{- end -}}
{{/*
Determine the service name depending on whether or not to use the release name.
*/}}
{{- define "otds.ingress.service" -}}
{{- $servicename := default .Values.global.otdsServiceName .Values.otdsws.serviceName -}}
{{- if eq .Values.global.otdsUseReleaseName true }}
{{- printf "%s-%s" .Release.Name $servicename -}}
{{- else }}
{{- printf "%s" $servicename -}}
{{- end }}
{{- end -}}

{{/*
Create paths value. Return the ingress.paths to expose
if Values.ingress.exposeIndividualEndpoints=true
and just return "/" if it is false.
*/}}
{{- define "otds.ingress.paths" -}}
{{- if eq .Values.ingress.exposeIndividualEndpoints true }}
{{- range .Values.ingress.paths -}}
{{- printf "%s%s" "," . -}}
{{- end -}}
{{- else }}
{{- printf "%s%s" "," "/" }}
{{- end }}
{{- end -}}
