variable "region" {
  default     = "ap-southeast-1"
  description = "AWS region"
}

variable "db_password" {
  description = "RDS root user password"
  sensitive   = true
}

variable "db_port" {
  description = "DB port"
  default	  = 5432
}

variable "allocated_storage" {
  description = "allocated storage for DB"
  default	  = 5
}

variable "max_allocated_storage" {
  description = "max allocated storage for DB to enable auto scaling"
  default	  = 200
}

variable "db_name" {
  description = "RDS DB name"
  default	  = "assignment1_db"
}

variable "publicly_access" {
  description = "Publicy accessible flag, Keep it as false for PROD"
  default	  = true
}

variable "skip_final_snapshot" {
  description = "Finale Snapshot flag, Keep it as false for PROD"
  default	  = true
}

variable "multi_az" {
  description = "DB Multizone availability flag"
  default	  = true
}

variable "log_connections" {
  description = " Log connections"
  default	  = 1
}
