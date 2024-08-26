echo "Creating git SSH key..."
read -p "Enter your GitHub email (leave empty to skip setting up GitHub): " git_email

if [ -n "$git_email" ]; then
	# Generate SSH key
	ssh-keygen -t rsa -b 4096 -C "$git_email"

	echo "Paste the following SSH key in your GitHub account:"
	echo "Settings > SSH and GPG keys > New SSH key (do NOT include the hashes ##..)"
	echo "##################################################"
	cat ~/.ssh/id_rsa.pub
	echo "##################################################"
	read -p "Press Enter once done."
else
	echo "Skipping SSH key setup."
fi

