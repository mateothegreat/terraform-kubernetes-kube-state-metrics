resource "kubernetes_deployment" "prometheus" {

    wait_for_rollout = false

    metadata {

        name      = var.name
        namespace = var.namespace

        labels = {

            app = var.name

        }

    }

    spec {

        replicas = 1

        selector {

            match_labels = {

                app = var.name

            }

        }

        template {

            metadata {

                name = var.name

                labels = {

                    app = var.name

                }

            }

            spec {

                service_account_name            = var.name
                automount_service_account_token = true

                container {

                    name  = "prometheus"
                    image = var.image

                    security_context {

                        allow_privilege_escalation = false
                        read_only_root_filesystem  = true
                        run_as_user                = 65534

                        capabilities {

                            drop = [ "ALL" ]

                        }


                    }

                    resources {

                        requests = {

                            cpu    = "100m"
                            memory = "100Mi"

                        }

                        limits = {

                            cpu    = "100m"
                            memory = "100Mi"

                        }

                    }

                    port {

                        name           = "metrics"
                        container_port = 8080
                        protocol       = "TCP"

                    }

                    port {

                        name           = "telemetry"
                        container_port = 8081
                        protocol       = "TCP"

                    }

                    readiness_probe {

                        http_get {

                            path = "/healthz"
                            port = 8080

                        }

                        initial_delay_seconds = 5
                        timeout_seconds       = 5

                    }

                    liveness_probe {

                        http_get {

                            path = "/healthz"
                            port = 8080

                        }

                        initial_delay_seconds = 5
                        timeout_seconds       = 5

                    }

                }

            }

        }

    }

}
