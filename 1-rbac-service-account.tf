resource "kubernetes_service_account" "metric" {

    automount_service_account_token = false

    metadata {

        name      = var.name
        namespace = var.namespace

    }

}
