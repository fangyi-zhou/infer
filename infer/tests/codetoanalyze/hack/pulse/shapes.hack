// Copyright (c) Facebook, Inc. and its affiliates.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

namespace Shapes;

class ShapeLogger {
  const type TSchemaShape = shape(
    ?'msg' => ?string,
    ?'debug_data' => ?string,
  );

  public static function logData(this::TSchemaShape $data) {
    \Level1\taintSink($data);
  }
}

class C1 {
  public function passViaShapeBad(SensitiveClass $sc) {
    ShapeLogger::logData(shape('msg' => 'Oh-oh', 'debug_data' => $sc->sensitiveField));
  }
}
