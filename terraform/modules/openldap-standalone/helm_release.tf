locals {
  default_acl_ldif = <<EOF
dn: olcDatabase={1}hdb,cn=config
changetype: modify
delete: olcAccess
-
add: olcAccess
olcAccess: to attrs=userPassword,shadowLastChange by self write by dn="${var.admin_dn}" write by anonymous auth by * read
olcAccess: to * by self write by "${var.admin_dn}" write by * read
EOF

  default_ous_ldif = <<EOF
dn: ou=Users,${local.domain_dn}
changetype: add
ou: Users
objectClass: organizationalUnit

dn: ou=Groups,${local.domain_dn}
changetype: add
ou: Groups
objectClass: organizationalUnit
EOF

  bind_user_group_ldif = <<EOF
dn: cn=bind,${local.domain_dn}
changetype: add
cn: bind
gidNumber: 10000
objectClass: posixGroup
objectClass: top

dn: ${var.bind_dn}
changetype: add
uid: bind
cn: Bind User
givenName: Bind
sn: User
userPassword: ${var.bind_password_crypted}
uidNumber: 10000
gidNumber: 10000
homeDirectory: /
loginShell: /sbin/nologin
objectClass: inetOrgPerson
objectClass: posixAccount
objectClass: top
EOF
}

resource "helm_release" "openldap" {
  namespace = var.namespace
  name      = "openldap"

  repository = "https://charts.helm.sh/stable"
  chart      = "openldap"
  version    = var.chart_version

  values = concat(
    [
      file("${path.module}/values.yaml"),
      jsonencode({
        env = {
          LDAP_DOMAIN = var.domain
          LDAP_ORGANISATION = var.organization
        }

        customLdifFiles = {
          "00-default-acl.ldif" = local.default_acl_ldif
          "01-default-ous.ldif" = local.default_ous_ldif
          "02-bind-user-group.ldif" = local.bind_user_group_ldif
        }
      })
    ],
    var.extra_values,
  )

  depends_on = [
    module.openldap-tls-certificate,
    kubernetes_persistent_volume_claim.openldap,
    kubernetes_secret.openldap,
  ]
}
