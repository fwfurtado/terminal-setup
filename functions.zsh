function __compile_completions_if_necesary() {
  autoload -Uz compinit 

  if [ ! -s "$HOME/.zcompdump" ]; then 
    compinit
  fi

}


function __docker_is_running() {
  nc -zv k8s.local.technology 2376 > /dev/null 2>&1  
  return $?
}


function __unset_if_defined() {

  local envvar=$(eval "echo \"\$$1\"")

  if [ ! -z "${envvar+x}" ]; then
    unset $1
  fi

}

