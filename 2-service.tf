resource "kubernetes_service" "metrics" {

    metadata {

        name      = var.name
        namespace = var.namespace

        labels = {

            app = var.name

        }

    }

    spec {

        selector = {

            app = var.name

        }

        port {

            name        = "http"
            port        = 8080
            target_port = 8080

        }

    }

}
