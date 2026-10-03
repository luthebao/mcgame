# Movement & Position

Position update RPC: `udcp(posX, posY, centerX, centerY, dir, moveInfo)`. Speed validation: `distance * 1000 / elapsedTime` compared against `serverSpeedThreshold` (~300 units/sec).
