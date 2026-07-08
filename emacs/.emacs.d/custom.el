;set before elscreen-start
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(elscreen-tab-background-face ((t (:background "brightblack"))))
 '(elscreen-tab-control-face ((t (:background "gray90" :foreground "gray60"))))
 '(elscreen-tab-current-screen-face ((t (:background "brown" :foreground "white"))))
 '(elscreen-tab-other-screen-face ((t (:background "gray10" :foreground "gray50"))))
 '(flycheck-color-mode-line-error-face ((t (:inherit flycheck-fringe-error :foreground "brightred" :weight semi-bold))))
 '(flycheck-error ((t (:inherit (error default) :underline "red"))))
 '(flycheck-error-list-error ((t (:inherit error))))
 '(flycheck-error-list-highlight ((t (:inherit highlight :underline t))))
 '(tab-bar-tab ((t (:background "#ad6d24" :foreground "#ebdbb2" :box nil))))
 '(tab-bar-tab-group-current ((t (:inherit tab-bar-tab :weight bold))))
 '(vertico-current ((t (:extend t :background "#697971"))))
 '(vertico-group-title ((t (:inherit shadow :foreground "orange" :slant italic)))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(beacon-color "#ed0547ad8099")
 '(coffee-indent-tabs-mode nil)
 '(coffee-tab-width 2)
 '(custom-safe-themes
   '("063095cf0fe6ed3990546ec77e5d3798a1e2ad5043350063467a71c69518bb24"
     "263e3a9286c7ab0c4f57f5d537033c8a5943e69d142e747723181ab9b12a5855"
     "841b6a0350ae5029d6410d27cc036b9f35d3bf657de1c08af0b7cbe3974d19ac"
     "37b6695bae243145fa2dfb41440c204cd22833c25cd1993b0f258905b9e65577"
     "b54376ec363568656d54578d28b95382854f62b74c32077821fdfd604268616a"
     "a9abd706a4183711ffcca0d6da3808ec0f59be0e8336868669dc3b10381afb6f"
     "8d8207a39e18e2cc95ebddf62f841442d36fcba01a2a9451773d4ed30b632443"
     "f5f80dd6588e59cfc3ce2f11568ff8296717a938edd448a947f9823a4e282b66"
     "ae3e78dcf686c7b839a826a6735ea7266e94488ec1741096b2af78e4eb8fe185"
     "c7fb1c0e2ebdfb73f0ccee8e536ba1978aa02dac17e2a18fd79e8ed6cbb3dcbf"
     "bf7f4fb05a45eae1a6bc1a009b7731b09260d945ec4c3c4ed7f5da06647a7946"
     "e546dc8090d2cd801fdba60b14795faeeb05a4f458fc65e7f83303756931b48a"
     "52d3ea24b80e61887a12823326c9f59b09b342e83fcff0c1e2c182010a117650"
     "adfe1d522a4a100edade12797079ebbabf742a48cf098e7d10ea14012e156ee8"
     "515ebca406da3e759f073bf2e4c8a88f8e8979ad0fdaba65ebde2edafc3f928c"
     "ba111a1e27970b905958219697ba50a78381c4f51d05eaf6fa6c0bdd5700847b"
     "81f53ee9ddd3f8559f94c127c9327d578e264c574cda7c6d9daddaec226f87bb"
     "c7737b9fc3471779c8e51ea0a37834d24aa80a0d6a79b215e7501227ada39855"
     "f079ef5189f9738cf5a2b4507bcaf83138ad22d9c9e32a537d61c9aae25502ef"
     "1f292969fc19ba45fbc6542ed54e58ab5ad3dbe41b70d8cb2d1f85c22d07e518"
     "e1f4f0158cd5a01a9d96f1f7cdcca8d6724d7d33267623cc433fe1c196848554"
     "77fff78cc13a2ff41ad0a8ba2f09e8efd3c7e16be20725606c095f9a19c24d3d"
     "6e33d3dd48bc8ed38fd501e84067d3c74dfabbfc6d345a92e24f39473096da3f"
     "2b501400e19b1dd09d8b3708cefcb5227fda580754051a24e8abf3aff0601f87"
     "be84a2e5c70f991051d4aaf0f049fa11c172e5d784727e0b525565bb1533ec78"
     "da75eceab6bea9298e04ce5b4b07349f8c02da305734f7c0c8c6af7b5eaa9738"
     "88f7ee5594021c60a4a6a1c275614103de8c1435d6d08cc58882f920e0cec65e"
     "8c7e832be864674c220f9a9361c851917a93f921fedb7717b1b5ece47690c098"
     "2078837f21ac3b0cc84167306fa1058e3199bbd12b6d5b56e3777a4125ff6851"
     "ea0d7bc97db70dfb9250e628a172cd630aa957de55ac0d68de5a7afdbaafc9c8"
     "3fe1ebb870cc8a28e69763dde7b08c0f6b7e71cc310ffc3394622e5df6e4f0da"
     "13096a9a6e75c7330c1bc500f30a8f4407bd618431c94aeab55c9855731a95e1"
     "4990532659bb6a285fee01ede3dfa1b1bdf302c5c3c8de9fad9b6bc63a9252f7"
     "e3daa8f18440301f3e54f2093fe15f4fe951986a8628e98dcd781efbec7a46f2"
     "dd4582661a1c6b865a33b89312c97a13a3885dc95992e2e5fc57456b4c545176"
     "56044c5a9cc45b6ec45c0eb28df100d3f0a576f18eef33ff8ff5d32bac2d9700"
     "7e377879cbd60c66b88e51fad480b3ab18d60847f31c435f15f5df18bdb18184"
     "9d29a302302cce971d988eb51bd17c1d2be6cd68305710446f658958c0640f68"
     "b5fd9c7429d52190235f2383e47d340d7ff769f141cd8f9e7a4629a81abc6b19"
     "aec7b55f2a13307a55517fdf08438863d694550565dee23181d2ebd973ebd6b8"
     "00cec71d41047ebabeb310a325c365d5bc4b7fab0a681a2a108d32fb161b4006"
     "dfb1c8b5bfa040b042b4ef660d0aab48ef2e89ee719a1f24a4629a0c5ed769e8"
     "014cb63097fc7dbda3edf53eb09802237961cbb4c9e9abd705f23b86511b0a69"
     "34cf3305b35e3a8132a0b1bdf2c67623bc2cb05b125f8d7d26bd51fd16d547ec"
     "c9ddf33b383e74dac7690255dd2c3dfa1961a8e8a1d20e401c6572febef61045"
     "f1b2de4bc88d1120782b0417fe97f97cc9ac7c5798282087d4d1d9290e3193bb"
     "1a1cdd9b407ceb299b73e4afd1b63d01bbf2e056ec47a9d95901f4198a0d2428"
     "718fb4e505b6134cc0eafb7dad709be5ec1ba7a7e8102617d87d3109f56d9615"
     "e9460a84d876da407d9e6accf9ceba453e2f86f8b86076f37c08ad155de8223c"
     "1b1e54d9e0b607010937d697556cd5ea66ec9c01e555bb7acea776471da59055"
     "ab04c00a7e48ad784b52f34aa6bfa1e80d0c3fcacc50e1189af3651013eb0d58"
     "5a0eee1070a4fc64268f008a4c7abfda32d912118e080e18c3c865ef864d1bea"
     "a0feb1322de9e26a4d209d1cfa236deaf64662bb604fa513cca6a057ddf0ef64"
     "84d2f9eeb3f82d619ca4bfffe5f157282f4779732f48a5ac1484d94d5ff5b279"
     "5cd0afd0ca01648e1fff95a7a7f8abec925bd654915153fb39ee8e72a8b56a1f"
     "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e"
     "9ff70d8009ce8da6fa204e803022f8160c700503b6029a8d8880a7a78c5ff2e5"
     "6c62b1cd715d26eb5aa53843ed9a54fc2b0d7c5e0f5118d4efafa13d7715c56e"
     "28ec8ccf6190f6a73812df9bc91df54ce1d6132f18b4c8fcc85d45298569eb53"
     "40c66989886b3f05b0c4f80952f128c6c4600f85b1f0996caa1fa1479e20c082"
     "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223"
     "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa"
     default))
 '(enh-ruby-indent-tabs-mode nil)
 '(evil-emacs-state-cursor '("#E57373" hbar) t)
 '(evil-insert-state-cursor '("#E57373" bar) t)
 '(evil-normal-state-cursor '("#FFEE58" box) t)
 '(evil-shift-width 2)
 '(evil-visual-state-cursor '("#C5E1A5" box) t)
 '(fci-rule-color "#14151E")
 '(go-ts-mode-indent-offset 2)
 '(helm-minibuffer-history-key "M-p")
 '(highlight-indent-guides-auto-enabled nil)
 '(highlight-symbol-colors
   '("#FFEE58" "#C5E1A5" "#80DEEA" "#64B5F6" "#E1BEE7" "#FFCC80"))
 '(highlight-symbol-foreground-color "#E0E0E0")
 '(highlight-tail-colors '(("#ed0547ad8099" . 0) ("#424242" . 100)))
 '(js-indent-level 2)
 '(jsx-indent-level 2)
 '(jsx-use-auto-complete t)
 '(key-chord-two-keys-delay 0.2)
 '(package-selected-packages
   '(evil-collection forge magit-popup doom-modeline all-the-icons
                     dired-subtree mu4e-maildirs-extension
                     arduino-mode org-bullets magithub espresso-theme
                     aggressive-indent yasnippet-snippets
                     arjen-grey-theme atom-dark-theme
                     atom-one-dark-theme dark-mint-theme
                     flatui-dark-theme foggy-night-theme abyss-theme
                     alect-themes apropospriate-theme company
                     company-quickhelp tide typescript-mode
                     dockerfile-mode docker-tramp markdown-mode
                     yaml-mode go-mode ample-theme beacon flx
                     yasnippet terraform-mode helm-ag which-key
                     counsel simplenote2 request-deferred
                     flycheck-color-mode-line flycheck key-chord
                     smart-mode-line swiper helm helm-core elscreen
                     evil-magit magit evil use-package))
 '(pos-tip-background-color "#3a933a933a93")
 '(pos-tip-foreground-color "#9E9E9E")
 '(ruby-align-chained-calls t)
 '(ruby-align-to-stmt-keywords '(begin if def))
 '(ruby-indent-tabs-mode nil)
 '(sh-basic-offset 2)
 '(split-height-threshold 100)
 '(split-width-threshold 100)
 '(tabbar-background-color "#357535753575")
 '(terraform-indent-level 2)
 '(typescript-indent-level 2)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   '((20 . "#d54e53") (40 . "goldenrod") (60 . "#e7c547")
     (80 . "DarkOliveGreen3") (100 . "#70c0b1") (120 . "DeepSkyBlue1")
     (140 . "#c397d8") (160 . "#d54e53") (180 . "goldenrod")
     (200 . "#e7c547") (220 . "DarkOliveGreen3") (240 . "#70c0b1")
     (260 . "DeepSkyBlue1") (280 . "#c397d8") (300 . "#d54e53")
     (320 . "goldenrod") (340 . "#e7c547") (360 . "DarkOliveGreen3")))
 '(vc-annotate-very-old-color nil))
