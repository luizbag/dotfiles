ln -fnrs .emacs.d ~
ln -fnrs .tmux ~
ln -fnrs .tmux.conf ~
ln -fnrs .gitconfig ~
ln -fnrs .bash_aliases ~
ln -fnrs bin ~/bin

cp -R .config ~
cp -R .local ~

fc-cache -vf ~/.local/share/fonts/
