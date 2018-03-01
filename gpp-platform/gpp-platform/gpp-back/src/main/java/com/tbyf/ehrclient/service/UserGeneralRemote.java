package com.tbyf.ehrclient.service;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;
import javax.xml.bind.annotation.XmlSeeAlso;
import javax.xml.ws.RequestWrapper;
import javax.xml.ws.ResponseWrapper;

/**
 * This class was generated by Apache CXF 3.1.10
 * 2017-04-10T10:58:15.597+08:00
 * Generated source version: 3.1.10
 * 
 */
@WebService(targetNamespace = "http://service.ehr.tbyf.com/", name = "UserGeneralRemote")
@XmlSeeAlso({ObjectFactory.class})
public interface UserGeneralRemote {

    @WebResult(name = "return", targetNamespace = "")
    @RequestWrapper(localName = "CheckPatientArchives", targetNamespace = "http://service.ehr.tbyf.com/", className = "com.tbyf.ehrclient.service.CheckPatientArchives")
    @WebMethod(operationName = "CheckPatientArchives")
    @ResponseWrapper(localName = "CheckPatientArchivesResponse", targetNamespace = "http://service.ehr.tbyf.com/", className = "com.tbyf.ehrclient.service.CheckPatientArchivesResponse")
    public java.lang.String checkPatientArchives(
        @WebParam(name = "arg0", targetNamespace = "")
        java.lang.String arg0
    );

    @WebResult(name = "return", targetNamespace = "")
    @RequestWrapper(localName = "CheckSpecialFile", targetNamespace = "http://service.ehr.tbyf.com/", className = "com.tbyf.ehrclient.service.CheckSpecialFile")
    @WebMethod(operationName = "CheckSpecialFile")
    @ResponseWrapper(localName = "CheckSpecialFileResponse", targetNamespace = "http://service.ehr.tbyf.com/", className = "com.tbyf.ehrclient.service.CheckSpecialFileResponse")
    public java.lang.String checkSpecialFile(
        @WebParam(name = "arg0", targetNamespace = "")
        java.lang.String arg0
    );

    @WebResult(name = "return", targetNamespace = "")
    @RequestWrapper(localName = "AddSfjlHypertension", targetNamespace = "http://service.ehr.tbyf.com/", className = "com.tbyf.ehrclient.service.AddSfjlHypertension")
    @WebMethod(operationName = "AddSfjlHypertension")
    @ResponseWrapper(localName = "AddSfjlHypertensionResponse", targetNamespace = "http://service.ehr.tbyf.com/", className = "com.tbyf.ehrclient.service.AddSfjlHypertensionResponse")
    public java.lang.String addSfjlHypertension(
        @WebParam(name = "arg0", targetNamespace = "")
        java.lang.String arg0
    );

    @WebResult(name = "return", targetNamespace = "")
    @RequestWrapper(localName = "PatientArchives", targetNamespace = "http://service.ehr.tbyf.com/", className = "com.tbyf.ehrclient.service.PatientArchives")
    @WebMethod(operationName = "PatientArchives")
    @ResponseWrapper(localName = "PatientArchivesResponse", targetNamespace = "http://service.ehr.tbyf.com/", className = "com.tbyf.ehrclient.service.PatientArchivesResponse")
    public java.lang.String patientArchives(
        @WebParam(name = "arg0", targetNamespace = "")
        java.lang.String arg0
    );

    @WebResult(name = "return", targetNamespace = "")
    @RequestWrapper(localName = "AddSfjlMentalillness", targetNamespace = "http://service.ehr.tbyf.com/", className = "com.tbyf.ehrclient.service.AddSfjlMentalillness")
    @WebMethod(operationName = "AddSfjlMentalillness")
    @ResponseWrapper(localName = "AddSfjlMentalillnessResponse", targetNamespace = "http://service.ehr.tbyf.com/", className = "com.tbyf.ehrclient.service.AddSfjlMentalillnessResponse")
    public java.lang.String addSfjlMentalillness(
        @WebParam(name = "arg0", targetNamespace = "")
        java.lang.String arg0
    );

    @WebResult(name = "return", targetNamespace = "")
    @RequestWrapper(localName = "GetPatientInfo", targetNamespace = "http://service.ehr.tbyf.com/", className = "com.tbyf.ehrclient.service.GetPatientInfo")
    @WebMethod(operationName = "GetPatientInfo")
    @ResponseWrapper(localName = "GetPatientInfoResponse", targetNamespace = "http://service.ehr.tbyf.com/", className = "com.tbyf.ehrclient.service.GetPatientInfoResponse")
    public java.lang.String getPatientInfo(
        @WebParam(name = "arg0", targetNamespace = "")
        java.lang.String arg0
    );

    @WebResult(name = "return", targetNamespace = "")
    @RequestWrapper(localName = "BuildSpecialFile", targetNamespace = "http://service.ehr.tbyf.com/", className = "com.tbyf.ehrclient.service.BuildSpecialFile")
    @WebMethod(operationName = "BuildSpecialFile")
    @ResponseWrapper(localName = "BuildSpecialFileResponse", targetNamespace = "http://service.ehr.tbyf.com/", className = "com.tbyf.ehrclient.service.BuildSpecialFileResponse")
    public java.lang.String buildSpecialFile(
        @WebParam(name = "arg0", targetNamespace = "")
        java.lang.String arg0
    );

    @WebResult(name = "return", targetNamespace = "")
    @RequestWrapper(localName = "AddSfjlDiabetes", targetNamespace = "http://service.ehr.tbyf.com/", className = "com.tbyf.ehrclient.service.AddSfjlDiabetes")
    @WebMethod(operationName = "AddSfjlDiabetes")
    @ResponseWrapper(localName = "AddSfjlDiabetesResponse", targetNamespace = "http://service.ehr.tbyf.com/", className = "com.tbyf.ehrclient.service.AddSfjlDiabetesResponse")
    public java.lang.String addSfjlDiabetes(
        @WebParam(name = "arg0", targetNamespace = "")
        java.lang.String arg0
    );
}
