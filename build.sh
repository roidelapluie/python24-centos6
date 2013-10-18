wget -c http://www.python.org/ftp/python/${PYVERSION}/Python-${PYVERSION}.tar.bz2 -O SOURCES/Python-${PYVERSION}.tar.bz2
wget -c http://www.python.jp/pub/JapaneseCodecs/JapaneseCodecs-${JPCODECS}.tar.gz -O SOURCES/JapaneseCodecs-${JPCODECS}.tar.gz
cp -rv SOURCES/* ~/rpmbuild/SOURCES/
sed -i 's/JENKINS_BUILD/'$BUILD_NUMBER'/' SPECS/python.spec
[ -d tmp ] && rm -rvf tmp
mkdir -p tmp
rpmbuild --define="version ${PYVERSION}" --define="_topdir $PWD" --define="_tmppath $PWD/tmp" -ba SPECS/python.spec
