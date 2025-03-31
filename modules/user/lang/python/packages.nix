{ pkgs, ... }:

{
  home.packages = with pkgs.python3Packages; [
      # attrs
      # autocommand
      # bcrypt
      # certifi
      # cffi
      # chardet
      # click
      # cryptography
      # cssselect
      # dbus-python
      # distro
      # dnspython
      # evdev
      # ewmh
      # fastjsonschema
      # fido2
      # idna
      # importlib-metadata
      # inflect
      # isodate
      # jeepney
      # keyring
      # libvirt
      # lxml
      # markdown
      # markupsafe
      # more-itertools
      mutagen
      # numpy
      # ordered-set
      # packaging
      pillow
      pip
      # platformdirs
      # ply
      # prettytable
      # proton-client
      # protonvpn-nm-lib
      # psutil
      # pulsectl
      # pyatspi
      # pybind11
      # pycairo
      # pycparser
      # pycups
      # pycurl
      # pydantic
      # pygobject3
      # pyinotify
      # pyopenssl
      # pyparsing
      # pyqt5
      # pyqt5_sip
      # pyscard
      # python-dateutil
      # pythondialog
      # python-gnupg
      # python-zbar
      # pyxdg
      # pyyaml
      # rdflib
      # requests
      # secretstorage
      # setproctitle
      # setuptools
      # six
      # systemd
      # tomli
      # urllib3
      # wcwidth
      # websockets
      # wheel
      # xlib
      # zipp
  ];
}
