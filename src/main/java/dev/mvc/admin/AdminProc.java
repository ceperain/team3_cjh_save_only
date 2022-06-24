package dev.mvc.admin;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.admin.AdminProc")
public class AdminProc implements AdminProcInter {

    @Autowired
    private AdminDAOInter AdminDAO;

}
