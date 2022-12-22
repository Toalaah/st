<h2 align="center"><i>ST – Simple Terminal</i></h2>

<p align="center">
<img src="https://img.shields.io/github/workflow/status/toalaah/st/Build?color=pink&logo=github&style=for-the-badge"
     alt="build status" />
<img src="https://img.shields.io/github/license/toalaah/st?color=add8e6&style=for-the-badge"
     alt="build status" />
<br><br>
This repo contains my personal <a href="https://st.suckless.org">st</a>
fork. The original repo can be found <a href="https://git.suckless.org/st">here</a>.

## Installation

1. Make sure you have the required Xlib headers installed (note that package
   names may vary slightly per package manager, the names below are given for
   apt)
    - `build-essential`
    - `libx11-dev`
    - `libxft`

1. To build, simply clone the repository and run the following make commands:

   ```bash
   git clone git@github.com:Toalaah/st.git
   cd st
   make
   sudo make install
   ```

## Patches

> All patches can be found in the [patches](./patches) folder.

### Applied Patches:

- [alpha](https://st.suckless.org/patches/alpha/)
- [boxdraw](https://st.suckless.org/patches/boxdraw/)
- [clipboard](https://st.suckless.org/patches/clipboard/)
- [scrollback](https://st.suckless.org/patches/scrollback/)
- [ligatures](https://st.suckless.org/patches/ligatures/)
- [glyph-wide-support](https://st.suckless.org/patches/glyph_wide_support/)

## License

[MIT](./LICENSE)
