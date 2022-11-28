resource "kubernetes_cluster_role" "metrics" {

    metadata {

        name = var.name

    }

    rule {

        api_groups = [ "" ]
        resources  = [

            "configmaps",
            "secrets",
            "nodes",
            "pods",
            "services",
            "serviceaccounts",
            "resourcequotas",
            "replicationcontrollers",
            "limitranges",
            "persistentvolumeclaims",
            "persistentvolumes",
            "namespaces",
            "endpoints"

        ]

        verbs = [ "list", "watch" ]

    }

    rule {

        api_groups = [ "apps" ]
        resources  = [

            "statefulsets",
            "daemonsets",
            "deployments",
            "replicasets"

        ]
        verbs = [ "list", "watch" ]

    }

    rule {

        api_groups = [ "batch" ]
        resources  = [ "cronjobs", "jobs" ]
        verbs      = [ "list", "watch" ]

    }

    rule {

        api_groups = [ "autoscaling" ]
        resources  = [ "horizontalpodautoscalers" ]
        verbs      = [ "list", "watch" ]

    }

    rule {

        api_groups = [ "authentication.k8s.io" ]
        resources  = [ "tokenreviews" ]
        verbs      = [ "create" ]

    }

    rule {

        api_groups = [ "authorization.k8s.io" ]
        resources  = [ "subjectaccessreviews" ]
        verbs      = [ "create" ]

    }

    rule {

        api_groups = [ "policy" ]
        resources  = [ "poddisruptionbudgets" ]
        verbs      = [ "list", "watch" ]

    }

    rule {

        api_groups = [ "certificates.k8s.io" ]
        resources  = [ "certificatesigningrequests" ]
        verbs      = [ "list", "watch" ]

    }

    rule {

        api_groups = [ "storage.k8s.io" ]
        resources  = [ "storageclasses", "volumeattachments" ]
        verbs      = [ "list", "watch" ]

    }

    rule {

        api_groups = [ "admissionregistration.k8s.io" ]
        resources  = [ "mutatingwebhookconfigurations", "validatingwebhookconfigurations" ]
        verbs      = [ "list", "watch" ]

    }

    rule {

        api_groups = [ "networking.k8s.io" ]
        resources  = [ "networkpolicies", "ingressclasses", "ingresses" ]
        verbs      = [ "list", "watch" ]

    }

    rule {

        api_groups = [ "coordination.k8s.io" ]
        resources  = [ "leases" ]
        verbs      = [ "list", "watch" ]

    }

    rule {

        api_groups = [ "rbac.authorization.k8s.io" ]
        resources  = [ "clusterrolebindings", "clusterroles", "rolebindings", "roles" ]
        verbs      = [ "list", "watch" ]

    }

}
