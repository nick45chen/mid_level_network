# mid_level_network

[![build](https://github.com/nick45chen/mid_level_network/actions/workflows/test-package.yml/badge.svg)](https://github.com/nick45chen/mid_level_network/actions/workflows/test-package.yml)

A flutter mid-level network framework between third party packaged and product.

```
flutter http / dio packages <=> mid_level_network <=> production logic
```

## Use this package as a library

This will add a line like this to your package's pubspec.yaml (and run an implicit dart pub get):

```
dependencies:
  mid_level_network:
    git:
      url: git@github.com:nick45chen/mid_level_network.git
      ref: master
```

### Import it

Now in your Dart code, you can use:

```
import 'package:mid_level_network/mid_level_network.dart';
```
