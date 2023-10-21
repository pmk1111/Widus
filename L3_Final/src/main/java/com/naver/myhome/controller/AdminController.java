package com.naver.myhome.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.naver.myhome.domain.Access;
import com.naver.myhome.domain.Company;
import com.naver.myhome.domain.Employee;
import com.naver.myhome.domain.User;
import com.naver.myhome.service.AdminService;
import com.naver.myhome.task.SendMail;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {

    //지니
    private AdminService adminService;
    private SendMail sendMail;

    @Autowired
    public AdminController(AdminService adminService, SendMail sendMail) {
        this.adminService = adminService;
        this.sendMail = sendMail;
    }


    @ResponseBody
    @GetMapping(value = "/companyinfo")
    public ModelAndView companyInfo(ModelAndView mv, String companyName, String companyDomain) throws Exception {
        int companyId = 1;


        //		    	Company company = adminService.companyInfo(companyId);
        //			    mv.addObject("companyinfo", company);

        String name = adminService.companyName(companyId);
        String domain = adminService.companyDomain(companyId);

        mv.addObject("companyName", name);
        mv.addObject("companyDomain", domain);
        mv.setViewName("admin/company-info");
        return mv;
    }


    @ResponseBody
    @PostMapping(value = "/updateName")
    public HashMap < String, String > updateName(ModelAndView mv, @RequestParam("companyId") int companyId,
                                                                  @RequestParam(value = "companyName", defaultValue = "", required = false) String companyName, 
                                                                  @RequestParam(value = "companyDomain", defaultValue = "", required = false) String companyDomain) {
      
        HashMap < String, String > map = new HashMap < String, String > ();
        if (companyDomain.equals("")) {
            // 회사명 업데이트
            int updateName = adminService.updateName(companyId, companyName);
            if (updateName > 0) {
                // 업데이트 성공
                String afterName = adminService.companyName(companyId);;
                map.put("afterName", afterName);

                map.put("message", "회사명이 성공적으로 업데이트되었습니다.");
            } else {
                // 업데이트 실패
                map.put("error", "회사명 업데이트 중 오류가 발생했습니다.");
            }
        } else {
            int updateDomain = adminService.updateDomain(companyId, companyDomain);
            if (updateDomain > 0) {
                // 업데이트 성공
                String afterDomain = adminService.companyName(companyId);;
                map.put("afterName", afterDomain);

                map.put("message", "전용 url이 성공적으로 업데이트되었습니다.");
            } else {
                // 업데이트 실패
                map.put("error", "전용 url 업데이트 중 오류가 발생했습니다.");
            }
        }
        return map;
    }



   

    @GetMapping(value = "/list")
    public ModelAndView employeeList(ModelAndView mv) {
        int companyId = 1; //회사번호

        // 회사의 직원 목록을 가져와서 모델에 추가
        List < Employee > employee = adminService.findEmployee(companyId);
        int countEmp = adminService.countEmp(companyId);
        mv.addObject("employee", employee);
        mv.addObject("countEmp", countEmp);

        // 중지된 유저 숫자
        int countStop = adminService.countStop(companyId);
        mv.addObject("countStop", countStop);

        // 대기중인 유저 숫자
        int countUser = adminService.countUser(companyId);

        mv.addObject("countUser", countUser);
        mv.setViewName("admin/employee-list");

        return mv;
    }

    //가입대기
    @ResponseBody
    @GetMapping(value = "/wait-reg")
    public List < User > regWait(@RequestParam("companyId") int companyId) {

        // 해당 컴퍼니 초대링크를 가진 유저 배열
        List < User > user = adminService.waitUser(companyId);

        return user;
    }

    // 가입 승인
    @ResponseBody
    @PostMapping(value = "/approve")
    public Map < String, Integer > approve(@RequestParam("userId") int userId,
        @RequestParam("companyId") int companyId) {

        adminService.approveUser(userId, companyId);
        adminService.addEmployee(userId, companyId);

        // 승인 후 최신 카운트 값 가져오기
        int countUser = adminService.countUser(companyId);
        int countEmp = adminService.countEmp(companyId);

        // 결과 맵 생성 및 값 설정
        Map < String, Integer > result = new HashMap < > ();
        result.put("countUser", countUser);
        result.put("countEmp", countEmp);

        return result;

    }

    // 가입 거절
    @ResponseBody
    @PostMapping(value = "/reject")
    public Map < String, Integer > reject(@RequestParam("userId") int userId,
        @RequestParam("companyId") int companyId) {
        adminService.rejectUser(userId, companyId);

        int countUser = adminService.countUser(companyId);

        Map < String, Integer > result = new HashMap < > ();
        result.put("countUser", countUser);

        return result;
    }


    //직원리스트
    @ResponseBody
    @GetMapping(value = "/employee-list")
    public List < Employee > getEmployee(@RequestParam("companyId") int companyId) {

        // 해당 컴퍼니 초대링크를 가진 유저 배열
        List < Employee > emp = adminService.findEmployee(companyId);

        return emp;
    }

    // 이용 중지
    @ResponseBody
    @PostMapping(value = "/emp-stop")
    public Map < String, Integer > employeeStop(@RequestParam("empId") int empId,
        @RequestParam("companyId") int companyId) {

        adminService.stopEmployeeStatus(empId);

        // 승인 후 최신 카운트 값 가져오기
        int countStop = adminService.countStop(companyId);
        int countEmp = adminService.countEmp(companyId);

        // 결과 맵 생성 및 값 설정
        Map < String, Integer > result = new HashMap < > ();
        result.put("countStop", countStop);
        result.put("countEmp", countEmp);

        return result;

    }

    //관리자 지정
    @ResponseBody
    @PostMapping(value = "/update-auth")
    public void empAuth(@RequestParam("empId") int employeeId) {
        adminService.updateAuth(employeeId);
    }

    // 이용중지리스트
    @ResponseBody
    @GetMapping(value = "/stop-list")
    public List < Employee > getStopEmp(@RequestParam("companyId") int companyId) {

        // 해당 컴퍼니 초대링크를 가진 유저 배열
        List < Employee > stopEmp = adminService.getStopList(companyId);

        return stopEmp;
    }

    // 중지 > 정상 상태변경
    @ResponseBody
    @PostMapping(value = "/back-emp")
    public Map < String, Integer > backEmp(@RequestParam("empId") int empId,
        @RequestParam("companyId") int companyId) {

        adminService.backEmp(empId);

        // 승인 후 최신 카운트 값 가져오기
        int countStop = adminService.countStop(companyId);
        int countEmp = adminService.countEmp(companyId);

        // 결과 맵 생성 및 값 설정
        Map < String, Integer > result = new HashMap < > ();
        result.put("countStop", countStop);
        result.put("countEmp", countEmp);

        return result;

    }

    //정상리스트 가져오기
    @ResponseBody
    @PostMapping(value = "/user-uselist")
    public List < Employee > userUseList(@RequestParam("companyId") int companyId) {


        // 회사의 직원 목록을 가져와서 모델에 추가
        List < Employee > employee = adminService.findEmployee(companyId);


        return employee;

    }

    @GetMapping(value = "/invite")
    public String invite(Company company, RedirectAttributes rattr, Model model, HttpServletRequest request) {


        return "admin/invite-employee";
    }




    @GetMapping(value = "/wait-approve")
    public String regwait() {
        return "admin/wait-approve";
    }



    //
    @PostMapping(value = "/sendMail")
    public String sendMail(String[] invite_box1) {
        String companyName = "widUs";
        String companyDomain = "example@widus.com";

        for (String box: invite_box1) {
            if (!box.equals(""))
                sendMail.sendInviteEmail(box, companyName, companyDomain);
        }
        return "admin/invite-employee";

    }
    
    @GetMapping(value="/admin-dashboard")
    public String adminDashboard() {
       return "admin/AdminDashboard";
    }
    //지니 끝


    /* 혜원 */
    @GetMapping(value = "/project-access-stats")
    public String projectAccessStats(ModelAndView mv, HttpServletRequest request) {

        List < Access > Access = adminService.getAccesslist();

        mv.addObject("Access", Access);

        return "project/project-access-stats";
    }


}