resource "kubernetes_cluster_role_binding" "metrics" {

    metadata {

        name = var.name

    }

    role_ref {

        api_group = "rbac.authorization.k8s.io"
        kind      = "ClusterRole"
        name      = kubernetes_cluster_role.metrics.metadata.0.name

    }

    subject {

        kind      = "ServiceAccount"
        name      = var.name
        namespace = var.namespace

    }

}
