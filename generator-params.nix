{
  ## Definitions at:
  ## https://github.com/input-output-hk/cardano-benchmarking/blob/cad-918-generator-service%2Binfra/nix/nixos/tx-generator-service.nix#L25
  txCount         = 1000;       # How many Txs to send, total.
  addTxSize       = 100;        # Extra Tx payload, in bytes.
  inputsPerTx     = 4;          # Inputs per Tx.
  outputsPerTx    = 4;          # Outputs per Tx.
  txFee           = 10000000;   # Tx fee, in Lovelace.
  tps             = 10;         # Strength of generated load, in TPS.
}
