FROM fedora:latest

MAINTAINER Kenneth E. Bellock <ken@bellock.net>

RUN set -x && dnf clean all && dnf -y distro-sync --setopt=deltarpm=0 && dnf -y update && dnf clean all && dnf -y install bugzilla httpd \
    "perl(GD)" "perl(Chart::Lines)" "perl(Template::Plugin::GD::Image)" \
    "perl(GD::Text)" "perl(GD::Graph)" "perl(XML::Twig)" "perl(PatchReader)" \
    "perl(Authen::Radius)" "perl(XMLRPC::Lite)" "perl(JSON::RPC)" \
    "perl(JSON::XS)" "perl(Test::Taint)" "perl(HTML::Scrubber)" \
    "perl(Encode::Detect)" "perl(Email::Reply)" "perl(Daemon::Generic)" \
    "perl(mod_perl2)" "perl(Apache2::SizeLimit)" "perl(File::MimeInfo::Magic)" \
    "perl(IO::Scalar)" "perl(DBD::mysql)" && dnf -y clean all

VOLUME /usr/share/bugzilla
EXPOSE 80

ENTRYPOINT /usr/sbin/httpd -DFOREGROUND
