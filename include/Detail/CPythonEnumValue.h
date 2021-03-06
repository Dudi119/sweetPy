#pragma once

#include <Python.h>
#include <string>
#include <memory>
#include <type_traits>
#include <structmember.h>

namespace sweetPy{

    class CPythonEnumValue
    {
    public:
        CPythonEnumValue(const std::string& name, int value)
                :m_name(name), m_value(value){}

        std::unique_ptr<PyMemberDef> ToPython() const {
            char* name = new char[m_name.length() + 1];
            std::copy_n(m_name.c_str(), m_name.length(), name);
            name[m_name.length()] = '\0';

            char* doc = new char[m_doc.length() + 1];
            std::copy_n(m_doc.c_str(), m_doc.length(), doc);
            doc[m_doc.length()] = '\0';

            return std::unique_ptr<PyMemberDef>(new PyMemberDef{
                    name,
                    T_INT,
                    m_offset,
                    READONLY,
                    doc
            });
        }
        int GetOffset() const { return m_offset; }
        int GetValue() const { return m_value; }

    private:
        std::string m_name;
        std::string m_doc;
        int m_offset;
        int m_value;
    };
}

