{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "fullname" -}}
{{- $name := default .Release.Name .Values.nameOverride -}}
{{- printf "%s" $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a random (but prefixed) name for unmanaged (hook) resources for easier cleanup
*/}}
{{- define "hookname" -}}
{{- $prefix := randAlpha 15 -}}
{{- printf "%s-%s" "hook" $prefix | lower | trunc 24 -}}
{{- end -}}
