{
  defaultBackends = [ "KatipBK" ];
  defaultScribes = [ [ "StdoutSK" "stdout" ] [ "FileSK" "/var/lib/cardano-node/logs/node.json" ] ];
  hasEKG = 12780;
  hasPrometheus = [ "127.0.0.1" 12798 ];
  minSeverity = "Debug";
  options = {
    cfokey = { value = "Release-1.0.0"; };
    mapBackends = {
      "cardano.node.metrics" = [ "EKGViewBK" ];
      "cardano.node.metrics.ChainDB" = [ "EKGViewBK" ];
    };
    mapSubtrace = {
      "#ekgview" =
        {
          contents = [
            [
              {
                contents = "cardano.epoch-validation.benchmark";
                tag = "Contains";
              }
              [
                {
                  contents = ".monoclock.basic.";
                  tag = "Contains";
                }
              ]
            ]
            [
              {
                contents = "cardano.epoch-validation.benchmark";
                tag = "Contains";
              }
              [
                {
                  contents = "diff.RTS.cpuNs.timed.";
                  tag = "Contains";
                }
              ]
            ]
            [
              {
                contents = "#ekgview.#aggregation.cardano.epoch-validation.benchmark";
                tag = "StartsWith";
              }
              [
                {
                  contents = "diff.RTS.gcNum.timed.";
                  tag = "Contains";
                }
              ]
            ]
          ];
          subtrace = "FilterTrace";
        };
      "#messagecounters.aggregation" = { subtrace = "NoTrace"; };
      "#messagecounters.ekgview" = { subtrace = "NoTrace"; };
      "#messagecounters.katip" = { subtrace = "NoTrace"; };
      "#messagecounters.monitoring" = { subtrace = "NoTrace"; };
      "#messagecounters.switchboard" = { subtrace = "NoTrace"; };
      "cardano.benchmark" = {
        contents = [ "GhcRtsStats" "MonotonicClock" "ProcessStats" "NetStats" "IOStats" ];
        subtrace = "ObservableTraceSelf";
      };
      "cardano.epoch-validation.utxo-stats" = { subtrace = "NoTrace"; };
    };
  };
  rotation = { rpKeepFilesNum = 20; rpLogLimitBytes = 25000000; rpMaxAgeHours = 24; };
  setupBackends = [ "KatipBK" "EKGViewBK" ];
  setupScribes = [
      {
        scFormat = "ScText";
        scKind = "StdoutSK";
        scName = "stdout";
      }
      {
        scFormat = "ScJson";
        scKind = "FileSK";
        scName = "/var/lib/cardano-node/logs/node.json";
        scRotation = {
          rpLogLimitBytes = 25000000;
          rpKeepFilesNum =  20;
          rpMaxAgeHours =   24;
        };
      }
    ];

  TracingVerbosity = "MaximalVerbosity";
  TraceBlockFetchClient = true;
  TraceBlockFetchDecisions = true;
  TraceBlockFetchProtocol = true;
  TraceBlockFetchProtocolSerialised = false;
  TraceBlockFetchServer = true;
  TraceChainDb = false;
  TraceChainSyncClient = false;
  TraceChainSyncBlockServer = false;
  TraceChainSyncHeaderServer = false;
  TraceChainSyncProtocol = true;
  TraceDNSResolver = false;
  TraceDNSSubscription = false;
  TraceErrorPolicy = false;
  TraceForge = true;
  TraceIpSubscription = false;
  TraceLocalChainSyncProtocol = true;
  TraceLocalTxSubmissionProtocol = true;
  TraceLocalTxSubmissionServer = true;
  TraceMempool = true;
  TraceMux = false;
  TraceTxInbound = true;
  TraceTxOutbound = true;
  TraceTxSubmissionProtocol = true;
}