// set permissions on parent directory
//   setfacl -Rm g:staff:rwX,d:g:staff:rwX /usr/local/apps/dart
// add user to `staff` group and logout/login

library maintenance.bin.dartupdate;

import 'dart:async' show Future;
import 'dart:io' as io;
import 'package:bwu_dart_archive_downloader/dart_update.dart';
import 'package:stack_trace/stack_trace.dart';

const String installDir = '/usr/local/bin/';

Future<Null> main() async {
  await Chain.capture(() async {
    io.Directory tempDir;
    tempDir = io.Directory.systemTemp.createTempSync('dart_sdk_download-');
    final updater = new DartUpdate(new SdkDownloadOptions()
      ..downloadDirectory = tempDir
      ..channel = DownloadChannel.beRaw
      ..installDirectory = new io.Directory('/usr/local/bin/dart/')
      ..backupDirectory = new io.Directory('/usr/local/bin/dart_backup'));

    await updater.update();
//      final String groupId = io.Platform.environment['DART_GROUP_ID'];
//      if(groupId == null || groupId.isEmpty) {
//        print(
//            'No "DART_GROUP_ID" environment variable provided to grant permissions to.');
//
//        io.Process.start('setfacl', [
//          '-Rm',
//          'g:${groupId}:rwX,d:g:${groupId}:rwX',
//          '/usr/local/bin/dart',
//        ]);
    await io.Process
        .start('chmod', ['-R', 'u+rwx,g+rx', '/usr/local/bin/dart']);
//      }
  }, onError: (dynamic error, stack) {
    print('Dart update failed: $error.');
    print(error);
    print(new Trace.from(stack).terse);
  });
}
