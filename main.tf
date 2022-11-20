terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.13.0"
    }
  }
}

variable flask_port {
  default = "5000"
}


resource "docker_network" "sd" {
  name = "sd"
}

resource "docker_container" "mongo" {
  name  = "mongo"
  image = "mongo"
  restart = "always"
  network_mode = "sd"
  
}

resource "docker_container" "flask_app" {
  name  = "flask_app"
  image = "flask_app"
  restart = "always"
  network_mode = "sd"

  ports {
    internal = "5000"
    external = "5000"
  }
}