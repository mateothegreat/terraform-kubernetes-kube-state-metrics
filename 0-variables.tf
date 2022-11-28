variable "name" {

    type        = string
    default     = "kube-state-metrics"
    description = "Name of the resources created."

}

variable "namespace" {

    type        = string
    default     = "kube-system"
    description = "Namespace of the resources created."

}

variable "image" {

    type        = string
    description = "Image to use for the deployment."
    default     = "registry.k8s.io/kube-state-metrics/kube-state-metrics:v2.7.0"

}
