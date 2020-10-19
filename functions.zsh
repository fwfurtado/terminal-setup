function __compile_completions_if_necesary() {
  autoload -Uz compinit 

  if [ ! -s "$HOME/.zcompdump" ]; then 
    compinit
  fi

}


function __docker_is_running() {

  netcat -z -w 2 k8s.local.technology 2376 > /dev/null 2>&1  

  echo $?
}


function __unset_if_defined() {

  local envvar=$(eval "echo \"\$$1\"")

  if [ ! -z "${envvar+x}" ]; then
    unset $1
  fi

}

function loft_key {
	# Configure the path to your ssh file here!!!
	local SSH_KEY_PATH=${1:-"$HOME/.ssh/id_rsa_loft"}
	
	if [ ! -f "${SSH_KEY_PATH}" ]; then
		echo "Missing ssh key file, please edit the function and set the variable SSH_KEY_PATH to the correct path"
		return 1
	fi
	
	local osname=$(uname -s)
	local decrypted_key=""
	
	grep 'ENCRYPTED' "${SSH_KEY_PATH}" 2>&1 > /dev/null
	if [ $? -eq 0 ]; then
		decrypted_key=$(openssl rsa -in "${SSH_KEY_PATH}" 2> /dev/null)
	else
		if ! ssh-keygen -y -P "" -f "${SSH_KEY_PATH}" 2>&1 > /dev/null; then
			echo "Can't continue as SSH key file is protected by a passphrase"
			return 1
		fi
	
		decrypted_key=$(cat "${SSH_KEY_PATH}")
	fi
	
	case "${osname}" in
		Linux*)  export EXTERNAL_REPOSITORY_SSH_KEY=$(echo "${decrypted_key}" | base64 -w0);;
		Darwin*) export EXTERNAL_REPOSITORY_SSH_KEY=$(echo "${decrypted_key}" | base64);;
	esac
}

