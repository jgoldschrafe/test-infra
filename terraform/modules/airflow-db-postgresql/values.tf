variable "host" {
  description = "PostgreSQL database host"
  type        = string
  default     = "localhost"
}

variable "port" {
  description = "PostgreSQL database port"
  type        = number
  default     = 5432
}

variable "username" {
  description = "Username for Airflow user"
  type        = string
  default     = "airflow"
}

variable "password" {
  description = "Password for Airflow user"
  type        = string
  default     = null
}

variable "database" {
  description = "Airflow database name"
  type        = string
  default     = "airflow"
}

output "values" {
  description = "Values for Airflow Helm chart"
  value       = {}
}
