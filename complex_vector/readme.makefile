
europa$ curl -4 -L --url 'https://gitlab.com/-/snippets/2099944/raw' -o nico_patch
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  2662    0  2662    0     0   9373      0 --:--:-- --:--:-- --:--:--  9373
europa$ 
europa$ patch -i nico_patch
Hmm...  Looks like a unified diff to me...
The text leading up to this was:
--------------------------
|diff --git a/complex_vector/Makefile.fbsd_amd64 b/complex_vector/Makefile.fbsd_amd64
|index 948d526..9aa7786 100644
|--- a/complex_vector/Makefile.fbsd_amd64
|+++ b/complex_vector/Makefile.fbsd_amd64
--------------------------
Patching file Makefile.fbsd_amd64 using Plan A...
Hunk #1 succeeded at 1.
Hmm...  The next patch looks like a unified diff to me...
The text leading up to this was:
--------------------------
|diff --git a/complex_vector/Makefile.fbsd_rv64gc b/complex_vector/Makefile.fbsd_rv64gc
|index 297a2a8..3dc2277 100644
|--- a/complex_vector/Makefile.fbsd_rv64gc
|+++ b/complex_vector/Makefile.fbsd_rv64gc
--------------------------
Patching file Makefile.fbsd_rv64gc using Plan A...
Hunk #1 succeeded at 1.
Hmm...  The next patch looks like a unified diff to me...
The text leading up to this was:
--------------------------
|diff --git a/complex_vector/fbsd_common.mk b/complex_vector/fbsd_common.mk
|new file mode 100644
|index 0000000..fe47b9d
|--- /dev/null
|+++ b/complex_vector/fbsd_common.mk
--------------------------
(Creating file fbsd_common.mk...)
Patching file fbsd_common.mk using Plan A...
Empty context always matches.
Hunk #1 succeeded at 1.
done

