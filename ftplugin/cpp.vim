if exists("b:did_cpp_ftplugin")
	finish
endif
let b:did_cpp_ftplugin = 1

"set fmr={,}
"set fdm=marker
"set fdm=syntax

call IMAP ("THELLO","#include <iostream>\<cr>\<cr>using std::cout;\<cr>using std::endl;\<cr>\<cr>int main(int argc, char **argv)\<cr>{\<cr>cout << \"<++>\" << endl;\<cr>return 0;\<cr>}","cpp")

call IMAP ("TDEF","#ifndef <++>_H\<cr>#define <++>\<cr>\<cr>\<cr>\<cr>#endif // <++>", "cpp")

call IMAP ("TFOR","for (long <++>=0; <++> < <++>; ++<++>)<++>","cpp")
"
call IMAP ("TCLASS","class <++>\<cr>{\<cr>\<bs>public:\<cr>\<bs>private:\<cr>}; // class <++>","cpp")

call IMAP ("T{{","\<cr>{\<cr><++>\<cr>}","cpp")

call IMAP ("TOST","std::ostream & operator<< \(std::ostream & os, <++> const & node\)\<cr>{\<cr>os << <++>\<cr>\<bs>return os;\<cr>}","cpp")

call IMAP ("TIMP","\<cr>/////////////////////////////////////////////////////////////////////////////////////////// Implementation /////\<cr>\<bs>\<bs>","cpp")

call IMAP ("TAUT","\<cr>///////////////////////////////////////////////////////////////////////////////////////// Autoregistration /////\<cr>\<bs>\<bs>","cpp")

call IMAP ("TEXC","catch \(Exception * e\)\<cr>
                   \{\<cr>
                   \e->Cout();\<cr>
                   \if (e->IsFatal()) {delete e; exit(1);}\<cr>
                   \delete e;\<cr>
                   \}\<cr>
                   \catch (char const * m)\<cr>
                   \{\<cr>
                   \std::cout << \"Fatal: \" << m << std::endl;\<cr>
                   \exit (1);\<cr>
                   \}\<cr>
                   \catch (...)\<cr>
                   \{\<cr>
                   \std::cout << \"Some exception \(...\) ocurred\\n\";\<cr>
                   \}","cpp")

call IMAP ("TCPPUc","#include <iostream>\<cr>
                   \#include <cppunit/extensions/TestFactoryRegistry.h>\<cr>
                   \#include <cppunit/ui/text/TestRunner.h>\<cr>
                   \\<cr>
                   \#include \"<++>_test.h\"\<cr>
                   \\<cr>
				   \using namespace std;\<cr>\<cr>
                   \int main\(int argc, char **argv\)\<cr>
                   \{\<cr>
                   \CppUnit::TextUi::TestRunner runner;\<cr>
                   \CppUnit::TestFactoryRegistry \& registry = CppUnit::TestFactoryRegistry::getRegistry\(\);\<cr>
                   \runner.addTest\(registry.makeTest\(\)\);\<cr>
                   \bool success = runner.run\(\"\",false\);\<cr>
                   \\<cr>
                   \std::cout << \"Pressione <enter> para continuar ...\" << std::endl;\<cr>
                   \std::cin.get\(\);\<cr>
                   \\<cr>
                   \return 0;\<cr>\<cr>
                   \}<++>\<cr>\<cr>
                   \//// compile with: g++ test.cpp -o test -lcppunit -ldl","cpp")

call IMAP("TCPPUh","#define <++>_TEST_H\<cr>
                  \\<cr>
                  \#include <cppunit/extensions/HelperMacros.h>\<cr>
                  \\<cr>
                  \class <++>_test : public CppUnit::TestFixture\<cr>
                  \{\<cr>
                  \public:\<cr>
                  \/******** Coloque os testes aqui **********/\<cr>
                  \void test_<++>\(\)\<cr>
                  \{\<cr><++>\<cr>
                  \}\<cr>
                  \/************ Fim dos testes **************/\<cr>
                  \private:\<cr>
                  \CPPUNIT_TEST_SUITE\(<++>_test\);\<cr>
                  \\<tab>CPPUNIT_TEST\(test_<++>\);\<cr>\<bs>
                  \CPPUNIT_TEST_SUITE_END\(\);\<cr>
                  \};\<cr>
                  \\<cr>
                  \CPPUNIT_TEST_SUITE_REGISTRATION\(<++>_test\);\<cr>
                  \\<cr>
                  \#endif // #define <++>_TEST_H\<cr>","cpp")
