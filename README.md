```

    If you can see the code here and it is written by me then
    it is under a GPL license unless otherwise stated in the
    source code.

    I sometimes stream live on YouTube :

        https://www.youtube.com/user/lastmiles/videos

    Revision : 25 Dec 2021

#NOTICE :

          Some of the code here may feel like malware in that
          it may take over your whole desktop and your mouse
          and it may spit in your coffee and kick your dog.
          Be careful and if the code DOES that horrific stuff
          there will be a big damn WARNING file in the code
          directory. Cats are entirely indifferent to this
          sort of stuff and will simply watch from a distance.

          beer money, coffee https://paypal.me/genunix?locale.x=en_US

          Also the code is usually really portable C and should
          just work on pretty much any decent machine and sane
          operating system. The book "Modern C" by Jens Gustedt
          is about the best resource you will ever find and it
          may be found for for free at :

            https://gustedt.gitlabpages.inria.fr/modern-c/

          Please read the following quote from that fine book :

            As the title of this book suggests, today’s C is not
            the same language as the one originally designed by its
            creator.  Right from the start, C has been in a continuous
            process of adjustment and improvement. Usually, early C is
            referred to as K&R C (Kernighan and Ritchie C) after the
            first book that made the language popular Kernighan and
            Ritchie [1978]. Since then, it has undergone an important
            standardization and extension process, now driven by ISO,
            the International Standards Organization. This led to the
            publication of a series of C standards in 1989, 1999, 2011,
            and 2018, commonly referred to as C89, C99, C11, and C17.

               Gustedt, Jens (2019). Modern C (2nd ed.). Manning.

        Almost everything I write can compile with a decent C99 compiler
        and that includes being pedantic. There are some exceptions and
        generally because I was firehosed with water and tazered into a
        corner by NVidia.  Or worse.  You will not see any C++ unless I
        was tormented by some horrific technology requirement. To quote
        our fine man Jens Gustedt once more :

            One common misconception is that C++ evolved from C by
            adding its particular features. Although this is
            historically correct (C++ evolved from a very early C), it
            is not particularly relevant today.
            In fact, C and C++ separated from a common ancestor more
            than 30 years ago and have evolved separately ever since.

            C and C++ are different: don’t mix them, and
                                     don’t mix them up.

               Gustedt, Jens (2019). Modern C (2nd ed.). Manning.

        Now then, taking into account all of the above you may think
        that anything in this repo will be perfectly beautiful and
        not at all strange. Here I must now quote from the C standard
        known as N1570 Committee Draft dated April 12, 2011 and also
        called ISO/IEC 9899:201x.  Therein we see the section :

            6.4.6 Punctuators

                Syntax

                    punctuator: one of

                        [     ]     (     )     {     }     .     ->
                        ++    --    &     *     +     -     ~     !
                        /     %     <<    >>    <     >     <=    >=
                        ==    !=    ^     |     &&    ||
                        ?     :     ;     ...
                        =     *=    /=    %=    +=    -=
                        <<=   >>=   &=    ^=    |=
                        ,     #     ##
                        <:    :>    <%    %>    %:    %:%:


                Semantics

                A punctuator is a symbol that has independent syntactic
                and semantic significance.  Depending on context, it may
                specify an operation to be performed (which in turn may
                yield a value or a function designator, produce a side
                effect, or some combination thereof) in which case it is
                known as an operator (other forms of operator also exist
                in some contexts). An operand is an entity on which an
                operator acts.

                In all aspects of the language, the six tokens

                    <:    :>    <%    %>    %:    %:%:

                behave, respectively, the same as the six tokens

                    [     ]     {     }     #     ##

                except for their spelling.


          A perverse abuse of the standard would be some silly stuff
          like this :

     000001
     000002  %:define _XOPEN_SOURCE 600
     000003  %:include <stdio.h>
     000004  int main(int f_0, char **bar)
     000005  <%
     000006      fprintf(stderr,"I see foo %i and %s is the bar\n",
     000007                                              f_0, bar<:0:>);
     000008      return 42;  /* a valid reply to this */
     000009  %>
     000010

        We may compile and then run that crud with LLVM/Clang on FreeBSD
        thus :

        $ /usr/bin/cc -std=iso9899:1999 -pedantic -pedantic-errors \
          -Weverything -Wno-reserved-id-macro -Wno-missing-prototypes \
          -g -O0 -fno-fast-math -fno-builtin -o what what.c -D_TS_ERRNO \
          -D_POSIX_PTHREAD_SEMANTICS -D_LARGEFILE64_SOURCE

        $ ./what the heck is this crud
        I see foo 6 and ./what is the bar


        The above would be a fine example of "Play stupid games and you
        win stupid prizes."

        I will avoid silly crud unless it demonstrates something useful.


          Dennis Clarke, 25 Dec 2021

```
