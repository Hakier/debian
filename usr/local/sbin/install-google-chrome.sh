#!/usr/bin/env bash

function addGoogleChromeRepository {
  echo "> Downloading the Google signing key and installing it..."
  wget -qO - https://dl.google.com/linux/linux_signing_key.pub |
    sudo gpg --dearmor -o /usr/share/keyrings/googlechrome-linux-keyring.gpg

  echo "> Setting up the Google Chrome repository..."
  echo "deb [arch=amd64 signed-by=/usr/share/keyrings/googlechrome-linux-keyring.gpg] http://dl.google.com/linux/chrome/deb/ stable main" |
    sudo tee /etc/apt/sources.list.d/google-chrome.list
} 

function installGoogleChrome {
  echo "> Updating the repository index..."
  sudo apt update

  case "${1}" in
    --beta)
      echo "> Installing Google Chrome Beta"
      sudo apt install -y google-chrome-beta
      ;;
    *)
      echo "> Installing Google Chrome Stable..."
      sudo apt install -y google-chrome-stable
      ;;
  esac
}

case "${1}" in
  -h | --help)
      echo "${0} [--beta]"
      ;;
  *)
      version="${1:---stable}"

      addGoogleChromeRepository &&
        installGoogleChrome "${version}"
      ;;
esac
