{{/*
# -----------------------------------------------------------------------------
# Helm helpers for NN Predictor
#
# Goal:
# - Centralize reusable names and labels across all chart templates.
# -----------------------------------------------------------------------------
*/}}

{{/*
# -----------------------------------------------------------------------------
# NAME HELPER
# -----------------------------------------------------------------------------
# Returns the canonical application name for this chart.
*/}}
{{- define "nn-predictor.name" -}}
nn-predictor
{{- end -}}

{{/*
# -----------------------------------------------------------------------------
# LABELS HELPER
# -----------------------------------------------------------------------------
# Returns shared labels used in all Kubernetes resources created by this chart.
*/}}
{{- define "nn-predictor.labels" -}}
app.kubernetes.io/name: {{ include "nn-predictor.name" . }}
app.kubernetes.io/component: api
app.kubernetes.io/part-of: aks-fastapi-demo
app.kubernetes.io/managed-by: Helm
{{- end -}}
