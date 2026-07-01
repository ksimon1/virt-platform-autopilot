{{- $storageClass := dig "metadata" "annotations" "platform.kubevirt.io/sbr-storage-class" "ocs-storagecluster-cephfs" .HCO.Object -}}
apiVersion: storage-based-remediation.medik8s.io/v1alpha1
kind: StorageBasedRemediationConfig
metadata:
  name: autopilot-recommended-values-detection-only
  namespace: openshift-workload-availability
spec:
  sbdWatchdogPath: /dev/watchdog
  sharedStorageClass: {{ $storageClass }}
  sbdTimeoutSeconds: 30
  maxConsecutiveFailures: 7
  detectOnlyMode: Enabled
