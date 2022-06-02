terraform {
  required_providers {
    zpa = {
      source  = "zscaler/zpa"
      version = "2.1.5"
    }
  }
  required_version = ">= 0.13"
}

provider zpa {}