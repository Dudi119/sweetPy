#include "CPythonClassTestModule.h"
#include "CPythonModule.h"
#include "CPythonClass.h"

using namespace pycppconn;

bool CPythonClassTestSubject::m_valid = false;

INIT_MODULE(CPythonClassTestModule, "A testing module for CPythonClass static method property")
{
    CPythonClass<CPythonClassTestSubject> subject(module, "TestClass", "A subject usertype for the CPythonClass static method property");
    subject.AddConstructor<int&>();
    subject.AddStaticMethod("Setter", "Setter - will change the value of m_valid into true", &CPythonClassTestSubject::Setter);
    subject.AddStaticMethod("Getter", "Getter - will retrieve m_valid", &CPythonClassTestSubject::Getter);
    subject.AddMember("byValueInt", &CPythonClassTestSubject::m_byValueInt, "int by value member support");
}