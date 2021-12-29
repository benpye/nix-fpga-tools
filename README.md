# Xilinx ISE Flake
This flake packages ISE as a Nix package. It is derived from ISE 14.7 for Windows 10 as this is in fact a Linux VM with ISE pre-installed and licensed.

## Prerequisites
- x86_64 Linux with Nix installed and flakes enabled.
- The `Xilinx_ISE_14.7_Win10_14.7_VM_0213_1.zip` file - this may be downloaded from the [Xilinx website](https://www.xilinx.com/member/forms/download/xef.html?filename=Xilinx_ISE_14.7_Win10_14.7_VM_0213_1.zip).
- The zip file must be added to the Nix store. If your machine has a relatively large amount of memory (>>16GB) then this may be done simply by `nix-store --add-fixed sha256 Xilinx_ISE_14.7_Win10_14.7_VM_0213_1.zip`. If your machine has less memory this will either fail, or take an excessive amount of time, this is because Nix loads the entire file into memory during the process. Instead the file may be added to the store manually as [detailed here](https://nixos.wiki/wiki/Cheatsheet#Adding_files_to_the_store).
- ~100GB of disk space for the install process, once installed the footprint is ~35GB.

## Usage
- The `xilinx-ise` wrapper can run any tool normally available on `$PATH` with ISE and will forward any arguments. This may be used directly via `nix run`. For example, to get the help for `par` you might run `nix run .#xilinx-ise -- par -?`. Note, the `--` is required so that Nix does not attempt to parse any arguments passed to the target.
- This flake also provides an overlay with a `xilinx-ise` package, installing this package provides some benefits:
  - The following applications have .desktop files and will be available as any other graphical application in your environment.
    - Analyzer (ChipScope Pro)
    - CompXlib
    - Constraints Editor
    - CORE Generator
    - FPGA Editor
    - iMPACT
    - Inserter (ChipScope Pro)
    - Project Navigator
    - Timing Analyzer
    - XPower Analyzer
  - Those and a number of other binaries have wrappers and are available on `$PATH`. Please check `pkgs/xilinx-ise/wrappers.nix` for the full list.
  - This package also provides the `xilinx-ise` wrapper for execution of any other ISE tools.

## Known issues
- There is no network access for any tool (including those with wrappers). This is because they are run within a network namespace allowing for a dummy NIC with the appropriate MAC for the included license to be added. So far I am only aware of SmartXplorer that this is a problem for - if there is critical functionality that this breaks it may be possible to come up with some solution.
- The FPGA editor tool appears to work but has a couple of minor issues. Firstly it takes a long time to launch, this would typically be resolved by running rpcbind/portmap however due to the broken networking this isn't possible. Additionally once running any file browse buttons in the FPGA editor will not work instead giving the error "Can't access this folder. Path is too long." - the path must be typed into the field.

## Contributions
I have had very little experience with ISE, this project was mostly spurred on because of a [Kintex-7 dev board that I recently became aware of](https://twitter.com/lucasteske/status/1473713374953357320). If there are any tools that fail to launch, or there are more tools that you believe should have wrappers by default, please open an issue and PRs to fix issues are very welcome!
