#!/bin/env bash
HOME=/var/tmp
RUBY_VERSION=$(cat ruby-version)

if [ -z "$RUBY_VERSION" ]; then
  echo "required ruby-version file."
  exit 1
fi

cd $HOME/rpmbuild/SOURCES && curl -LO http://cache.ruby-lang.org/pub/ruby/$(echo $RUBY_VERSION | sed -e 's/\.[0-9]$//')/ruby-$RUBY_VERSION.tar.gz

rpmbuild -ba $HOME/rpmbuild/SPECS/ruby22x.spec

cp $HOME/rpmbuild/RPMS/x86_64/* /shared/
cp $HOME/rpmbuild/SRPMS/* /shared/
