FROM quay.io/fedora/fedora-bootc:41
RUN dnf -y update && dnf -y install tmux mkpasswd
RUN pass=$(mkpasswd --method=SHA-512 --rounds=4096 redhat) && useradd -m -G wheel bootc-user -p $pass
RUN echo "%wheel        ALL=(ALL)       NOPASSWD: ALL" > /etc/sudoers.d/wheel-sudo
#RUN dnf -y install httpd && \
#    systemctl enable httpd && \
#    mv /var/www /usr/share/www && \
#    sed -ie 's,/var/www,/usr/share/www,' /etc/httpd/conf/httpd.conf
#RUN echo "Welcome to the updated bootc-http instance!" > /usr/share/www/html/index.html
RUN echo "This is a RHEL 9.4 VM installed using a bootable container as an rpm-ostree source!" > /etc/motd.d/10-first-setup.motd
EXPOSE 80
CMD [ "/sbin/init" ]
