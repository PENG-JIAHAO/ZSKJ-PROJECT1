package com.isscollege.gdce.controller;

import com.isscollege.gdce.domain.OperateRecord;
import org.apache.commons.lang3.BooleanUtils;
import com.isscollege.gdce.util.RIDUtil;
import com.isscollege.gdce.domain.Company;
import com.isscollege.gdce.domain.User;
import com.isscollege.gdce.model.IRegisterModel;
import com.isscollege.gdce.util.FileUtil;
import com.isscollege.gdce.util.VerifyCode;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.lang.reflect.Field;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@PropertySource("classpath:filePath.properties")
@RequestMapping("/register")
public class RegisterController
{
    private static final Logger LOGGER = Logger.getLogger(RegisterController.class);
    private static final long serialVersionUID = 1L;
    private String msg = "";
    @Value("${uploadPath}")
    private String uploadPath;
    @Value("${fileServerAdderss}")
    private String fileServerAdderss;
    @Autowired
    private IRegisterModel registerModel;
    //    private static final String FILE_PATH = "/imgs/openLicense/";
//    private static final String realPath = "D:/dev/tomcat-7.0.75/webapps/gdce/WEB-INF/lib/dbpool.properties";
    private static String currentUser = "";
    private String idPattern = "^([1-6][1-9]|50)\\d{4}(18|19|20)\\d{2}((0[1-9])|10|11|12)(([0-2][1-9])|10|20|30|31)\\d{3}[0-9Xx]$";
    // 用户的企业Id
    private static String currentId = "";
    private static boolean loginState;
    private boolean flag;
    @Value("${file_baseFile}")
    private String baseFile;
    private Company companyOld;
    private Company company;


    public void setRegisterModel(IRegisterModel registerModel)
    {
        this.registerModel = registerModel;
    }

    @RequestMapping("/loadQualificationImage")
    public void showImage(HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        response.setContentType("image/jpeg");
        OutputStream toClient = response.getOutputStream();
        toClient.write(FileUtil.readFile(uploadPath + request.getParameter("path")));
        toClient.flush();
        toClient.close();
    }

    @RequestMapping(value = "datas", produces = "text/javascript;charset=utf-8;")
    protected void doReturn(HttpServletRequest request, HttpServletResponse response)
    {
        response.setContentType("text/html;charset=UTF-8");
        String datas = org.apache.commons.lang3.StringUtils.defaultString(request.getParameter("datas"));
        // 验证用户名是否已注册
        isLoginnameRegister(datas, request, response);
        // 管理员姓名是否已注册
        isUsernameRegister(datas, request, response);
        // 管理员联系方式是否已注册
        isPhoneNumberRegister(datas, request, response);
        // 管理员联系方式是否已注册
        isEmailRegister(datas, request, response);
    }

    // 验证用户名是否已注册
    private void isLoginnameRegister(String datas, HttpServletRequest request, HttpServletResponse response)
    {
        String loginname = org.apache.commons.lang3.StringUtils.defaultString(request.getParameter("loginname"));
        PrintWriter out = null;
        if (datas.equals("loginname"))
        {
            if (!(flag = registerModel.ajaxValidateLoginname(loginname)))
            {
                try
                {
                    out = response.getWriter();
                } catch (IOException e)
                {
                    LOGGER.error("管理员用户名验证信息写出异常", e);
                }
                out.write("true");
            }
        }

    }

    // 管理员姓名是否已注册
    private void isUsernameRegister(String datas, HttpServletRequest request, HttpServletResponse response)
    {
        String username = org.apache.commons.lang3.StringUtils.defaultString(request.getParameter("username"));
        PrintWriter out = null;
        if (datas.equals("username"))
        {
            if (!registerModel.ajaxValidateUsername(username))
            {
                try
                {
                    out = response.getWriter();
                } catch (IOException e)
                {
                    LOGGER.error("管理员姓名验证信息写出异常", e);
                }
                out.write("true");
            }
        }
    }

    // 管理员联系方式是否已注册
    private void isPhoneNumberRegister(String datas, HttpServletRequest request, HttpServletResponse response)
    {
        String phoneNumber = org.apache.commons.lang3.StringUtils.defaultString(request.getParameter("phoneNumber"));
        PrintWriter out = null;
        if (datas.equals("phoneNumber"))
        {
            if (!registerModel.ajaxValidatePhoneNumber(phoneNumber))
            {
                try
                {
                    out = response.getWriter();
                } catch (IOException e)
                {
                    LOGGER.error("管理员联系方式验证信息写出异常", e);
                }
                out.write("true");
            }
        }
    }

    // 管理员邮箱是否已注册
    private void isEmailRegister(String datas, HttpServletRequest request, HttpServletResponse response)
    {
        String email = org.apache.commons.lang3.StringUtils.defaultString(request.getParameter("email"));
        PrintWriter out = null;
        if (datas.equals("email"))
        {
            if (!registerModel.ajaxValidateEmail(email))
            {
                try
                {
                    out = response.getWriter();
                } catch (IOException e)
                {
                    LOGGER.error("管理员邮箱验证信息写出异常", e);
                }
                out.write("true");
            }
        }
    }

    // 企业代码回调函数
    @RequestMapping("/findcompanyId")
    protected void findCompanyId(HttpServletRequest request, HttpServletResponse response) throws IOException
    {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String companyId = StringUtils.defaultString(request.getParameter("companyId"));
        out.write(BooleanUtils.toStringTrueFalse(registerModel.findcompanyId(companyId)));
    }

    @RequestMapping("/adduser")
    protected String doRegist(HttpServletRequest request, HttpServletResponse response)
    {
        response.setContentType("text/html;charset=UTF-8");

        User user = new User();

        String name = org.apache.commons.lang3.StringUtils.defaultString(request.getParameter("loginname"), "");
        String password = org.apache.commons.lang3.StringUtils.defaultString(request.getParameter("password"), "未填 ");
        String password1 = org.apache.commons.lang3.StringUtils.defaultString(request.getParameter("password1"), "未填 ");
        String permission = org.apache.commons.lang3.StringUtils.defaultString(request.getParameter("permission"), "未填 ");
        String verifyCode = org.apache.commons.lang3.StringUtils.defaultString(request.getParameter("verifyCode"));

        // 获取验证码的内容
        String text = VerifyCode.getText();

        user.setName(name);
        user.setLoginState(loginState);
        user.setPassword(password);
        user.setPermission(permission);
        String alertMassage = "";
        String setHeaderMassage = "";
        if ((!name.equals("")))
        {
            if (!flag)
            {
                alertMassage = "用户名已存在,请重新注册！";
                setHeaderMassage = "/jsp/user/register.jsp";
            } else if (!(password.equals(password1)) || (password.equals("")))
            {
                alertMassage = "密码错误,请重新注册！";
                setHeaderMassage = "/jsp/user/register.jsp";
            } else if ((verifyCode.equals("")) || (!verifyCode.equalsIgnoreCase(text)))
            {
                alertMassage = "验证码错误,请重新注册！";
                setHeaderMassage = "/jsp/user/register.jsp";
            } else
            {
                registerModel.addUser(user);
                alertMassage = "恭喜您，注册成功,请登录！";
                setHeaderMassage = "/jsp/user/login.jsp";
            }
        } else
        {
            alertMassage = "姓名不能为空,请重新注册！";
            setHeaderMassage = "/jsp/user/register.jsp";
        }

        request.setAttribute("setHeaderMessage", request.getContextPath() + setHeaderMassage);
        request.setAttribute("alertMessage", alertMassage);
        return "user/register";
    }

    // 检验addcompany方法
    private boolean check(String data, String zhengze)
    {
        if (data.equals(""))
        {
            return false;
        } else if (!data.matches(zhengze))
        {
            return false;
        }
        return true;
    }

    protected void checkCompanyInfo(String companyInfo, String regular, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        if (!check(companyInfo, regular))
        {
            response.getWriter().print("<script language='javascript'>alert('数据异常')</script>");
            response.getWriter().print("<script language='javascript'>window.location.href=\"" + request.getContextPath() + "/jsp/user/com_qualification_update.jsp\"</script>");
            return;
        }
    }

/*    // 用户完善信息
    @RequestMapping("/addcompany")
    protected void doRegist(HttpServletRequest request, HttpServletResponse response, HttpSession session, @RequestParam("openLicensePath") MultipartFile openLicensePath, @RequestParam("taxRegisterCodePath") MultipartFile taxRegisterCodePath, @RequestParam("companyCodePath") MultipartFile companyCodePath, @RequestParam("bankAccountCodePath") MultipartFile bankAccountCodePath, @RequestParam("legalPersonCodePath") MultipartFile legalPersonCodePath, @RequestParam("bussionLicenseCodePath") MultipartFile bussionLicenseCodePath) throws ServletException, IOException
    {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        User user = new User();
        MultipartFile[] multipartFiles = {openLicensePath, taxRegisterCodePath, companyCodePath, bankAccountCodePath, legalPersonCodePath, bussionLicenseCodePath};
        Company company = new Company();

        String companyId = org.apache.commons.lang3.StringUtils.defaultString(request.getParameter("companyId"), "");
        checkCompanyInfo(companyId, "^[A-Za-z0-9]{18}$", request, response);
        String companyName = org.apache.commons.lang3.StringUtils.defaultString(request.getParameter("companyName"), "");
        checkCompanyInfo(companyName, "^[\\u4E00-\\u9FA5A-Za-z0-9]{3,50}$", request, response);
        String legalPerson = org.apache.commons.lang3.StringUtils.defaultString(request.getParameter("legalPerson"), "");
        checkCompanyInfo(legalPerson, "^[\\u4e00-\\u9fa5]{2,30}$", request, response);
        String legalPersonId = org.apache.commons.lang3.StringUtils.defaultString(request.getParameter("legalPersonId"), "");
        checkCompanyInfo(legalPersonId, "^([1-6][1-9]|50)\\d{4}(18|19|20)\\d{2}((0[1-9])|10|11|12)(([0-2][1-9])|10|20|30|31)\\d{3}[0-9Xx]$", request, response);
        String companyAddress = org.apache.commons.lang3.StringUtils.defaultString(request.getParameter("companyAddress"), "");
        checkCompanyInfo(companyAddress, "^[\\u4E00-\\u9FA5A-Za-z0-9]{1,30}$", request, response);
        String companyEmail = org.apache.commons.lang3.StringUtils.defaultString(request.getParameter("companyEmail"), "");
        checkCompanyInfo(companyEmail, "^\\w+((-\\w+)|(\\.\\w+))*\\@[A-Za-z0-9]+((\\.|-)[A-Za-z0-9]+)*\\.[A-Za-z0-9]+$", request, response);
        String phoneNumber = org.apache.commons.lang3.StringUtils.defaultString(request.getParameter("phoneNumber"), "");
        checkCompanyInfo(phoneNumber, "^((0\\d{2,3}-\\d{7,8})|(\\d{8,11}))$", request, response);
        String companyFax = org.apache.commons.lang3.StringUtils.defaultString(request.getParameter("companyFax"), "");
        checkCompanyInfo(companyFax, "^[0-9]*$", request, response);
        String postalCode = org.apache.commons.lang3.StringUtils.defaultString(request.getParameter("postalCode"), "");
        checkCompanyInfo(postalCode, "^\\d{6}$", request, response);
        float registerMoney = Float.parseFloat(request.getParameter("registerMoney"));
        String openLicenseId = org.apache.commons.lang3.StringUtils.defaultString(request.getParameter("openLicenseId"), "");
        checkCompanyInfo(openLicenseId, "^\\d{13}$", request, response);
        String bussionLicense = org.apache.commons.lang3.StringUtils.defaultString(request.getParameter("bussionLicense"), "");
        checkCompanyInfo(bussionLicense, "^\\d{15}$", request, response);
        String taxRegisterId = org.apache.commons.lang3.StringUtils.defaultString(request.getParameter("taxRegisterId"), "");
        checkCompanyInfo(taxRegisterId, "^\\d{13}$", request, response);
        String openBank = org.apache.commons.lang3.StringUtils.defaultString(request.getParameter("openBank"), "");
        checkCompanyInfo(openBank, "^[\\u4e00-\\u9fa5]{1,10}$", request, response);
        String bankAccount = org.apache.commons.lang3.StringUtils.defaultString(request.getParameter("bankAccount"), "");
        checkCompanyInfo(bankAccount, "^\\d{18}$", request, response);
        String goodsAddress = org.apache.commons.lang3.StringUtils.defaultString(request.getParameter("goodsAddress"), "");
        checkCompanyInfo(goodsAddress, "^[\\u4E00-\\u9FA5A-Za-z0-9]{1,20}$", request, response);
        String transportStyle = org.apache.commons.lang3.StringUtils.defaultString(request.getParameter("transportStyle"), "");
        checkCompanyInfo(transportStyle, "^[\\u4E00-\\u9FA5A-Za-z0-9]{1,15}$", request, response);
        String companyProfile = org.apache.commons.lang3.StringUtils.defaultString(request.getParameter("companyProfile"), "");
        String accountantName = org.apache.commons.lang3.StringUtils.defaultString(request.getParameter("accountantName"), "");
        checkCompanyInfo(accountantName, "^[\\u4e00-\\u9fa5]{2,10}$", request, response);
        String email = org.apache.commons.lang3.StringUtils.defaultString(request.getParameter("email"), "");
        checkCompanyInfo(email, "^\\w+((-\\w+)|(\\.\\w+))*\\@[A-Za-z0-9]+((\\.|-)[A-Za-z0-9]+)*\\.[A-Za-z0-9]+$", request, response);
        String phone = org.apache.commons.lang3.StringUtils.defaultString(request.getParameter("phone"), "");
        checkCompanyInfo(phone, "^\\d{7,8}$", request, response);

        session.setAttribute("email", email);
        session.setAttribute("phone", phone);
        session.setAttribute("companyProfile", companyProfile);
        if (session.getAttribute("currentUser") != null)
        {
            User user1 = (User) request.getSession().getAttribute("currentUser");
            currentUser = user1.getName();
            currentId = user1.getCompanyId();
            loginState = user1.isLoginState();
        }

        user.setName(currentUser);
        user.setLoginState(loginState);
        user.setCompanyId(companyId);
        company.setCompanyId(companyId);
        company.setCompanyName(companyName);
        company.setLegalPerson(legalPerson);
        company.setLegalPersonId(legalPersonId);
        company.setAccountantName(accountantName);
        company.setBankAccount(bankAccount);
        company.setBussionLicense(bussionLicense);
        company.setCompanyAddress(companyAddress);
        company.setCompanyEmail(companyEmail);
        company.setCompanyFax(companyFax);
        company.setCompanyProfile(companyProfile);
        company.setEmail(email);
        company.setGoodsAddress(goodsAddress);
        company.setTransportStyle(transportStyle);
        company.setOpenBank(openBank);
        company.setOpenLicenseId(openLicenseId);
        company.setPhone(phone);
        company.setPostalCode(postalCode);
        company.setPhoneNumber(phoneNumber);
        company.setTaxRegisterId(taxRegisterId);
        company.setRegisterMoney(registerMoney);
        company.setSubmitDate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
        company.setRecordID(RIDUtil.getRID());
        // 用户修改或完善企业信息
        if (!currentId.equals(""))
        {
            // 第二次老用户修改信息
            // 修改企业信息

            registerModel.updateCompany(company, companyId);
            registerModel.updateAccountant(company, accountantName);
            registerModel.updateUserloginstateByName(user);
            updataUploadFile(company, currentUser, multipartFiles);

            response.getWriter().print("<script language='javascript'>alert('恭喜您，企业信息修改完成,请重新登录账号！')</script>");
            response.setHeader("refresh", "1;" + request.getContextPath() + "/jsp/user/login.jsp");
        } else
        {
            // 新用户第一次完善企业信息
            // 保存前端页面传入的企业基本信息
            registerModel.companyTx(company, user);
            // 保存前端上传的用户企业资质信息
            // 保存文件上传
            saveUploadFile(company, currentUser, request.getContextPath(), multipartFiles);
            response.getWriter().print("<script language='javascript'>alert('恭喜您，企业信息已完善,请重新登录！')</script>");
            response.setHeader("refresh", "1;" + request.getContextPath() + "/jsp/user/login.jsp");
        }
    }*/

/*    // 二次更新的图片覆盖
    @SuppressWarnings("rawtypes")
    private Map updataUploadFile(Company company, String userName, MultipartFile[] multipartFiles)
    {

        //对应文件名

        HashMap<String, String> name = new HashMap<String, String>()
        {
            {
                this.put("openLicensePath", "营业执照");
                this.put("taxRegisterCodePath", "税务登记证");
                this.put("companyCodePath", "组织机构代码证");
                this.put("bankAccountCodePath", "开户许可证");
                this.put("legalPersonCodePath", "法人身份证");
                this.put("bussionLicenseCodePath", "经营许可证");
            }
        };


        //map存放消息
        HashMap map = new HashMap();
        //按照名字讲文件分类
        Map<String, MultipartFile> fileNameList = new HashMap<>();
//        if (multipartFiles!=null) {
        Arrays.stream(multipartFiles).forEach(x -> fileNameList.put(x.getName(), x));
        //对每个文件进行操作
        fileNameList.forEach((x, y) ->
        {
            if (y.isEmpty())
                return;
            ;
            //找到服务器存储的文件名
            //反射获取属性
            Company companyOld = registerModel.queryCompanyByCompanyID(company.getCompanyId());

            Field declaredField;
            String path = null;
            try
            {
                declaredField = companyOld.getClass().getDeclaredField(x);
                declaredField.setAccessible(true);
                path = (String) declaredField.get(companyOld);
            } catch (Exception e)
            {
                e.printStackTrace();
            }

            //新名字
            String fileName = name.get(x) + ".png";

            //先删除要覆盖的文件
            String filePath = path.replace("%2F", "\\");
            String oldPath = uploadPath + filePath;
            deleteFile(new File(oldPath));

            //设定要上传的父文件夹地址
            String saveFilePath = uploadPath + userName + "\\license\\";
            try
            {
                //上传
                y.transferTo(new File(new File(saveFilePath), fileName));
                map.put("error", 0);
                map.put("url", fileServerAdderss + fileName);
            } catch (IllegalStateException e)
            {
                map.put("error", 1);
                map.put("message", "文件上传失败，请稍后重新尝试！");
                LOGGER.info("文件上传失败", e);
            } catch (IOException e)
            {
                LOGGER.info("IO流异常", e);
            }

        });

        return map;
    }*/


    // 保存遍历的文件
    private List<String> saveErgodicFile(MultipartFile[] multipartFiles, HashMap map, String userName)
    {
        String[] name = {"营业执照", "税务登记证", "组织机构代码证", "开户许可证", "法人身份证", "经营许可证"};
        int i = 0;
        String fileName = null;
        String filePath = null;
        File saveFilePath = null;
        List<String> filePathList = new ArrayList<>();
        for (MultipartFile multipartFile : multipartFiles)
        {
            if (!multipartFile.isEmpty())
            {
                String oldName = multipartFile.getOriginalFilename();
                String[] fileItems =StringUtils.split(oldName, "\\.");
                fileName = name[i] + "." + fileItems[1];
                saveFilePath = new File(uploadPath, userName + "\\license\\");
                saveFilePath.mkdirs();
                try
                {
                    multipartFile.transferTo(new File(saveFilePath, fileName));
                    map.put("error", 0);
                    map.put("url", fileServerAdderss + fileName);
                } catch (IllegalStateException e)
                {
                    map.put("error", 1);
                    map.put("message", "文件上传失败，请稍后重新尝试！");
                    LOGGER.info("文件上传失败", e);
                } catch (IOException e)
                {
                    LOGGER.info("IO流异常", e);
                }
            }
            i++;
            //uploadPath+
            filePath = (userName + "\\license\\" + fileName).replace("\\", "%2F");
            //System.out.println(filePath);
            filePathList.add(filePath);
        }
        return filePathList;
    }

    // 遍历文件且删除该目录下的文件
    private static void deleteFile(File file)
    {

        if (file.isDirectory())
        {
            File[] files = file.listFiles();
            for (File f : files)
            {
                if (f.isFile())
                {
                    f.delete();
                } else if (file.isDirectory())
                {
                    deleteFile(f);
                }
            }
        } else file.delete();


    }

/*    *//*
     * 保存用户上传企业资质复印件照片
     *//*
    @SuppressWarnings("rawtypes")
    private Map saveUploadFile(Company company, String userName, String rootPath, MultipartFile[] multipartFiles)
    {
        HashMap map = new HashMap();
        if (multipartFiles != null && multipartFiles.length > 0)
        {
            List<String> filePathList = saveErgodicFile(multipartFiles, map, userName);
            company.setOpenLicensePath(filePathList.get(0));
            company.setTaxRegisterCodePath(filePathList.get(1));
            company.setCompanyCodePath(filePathList.get(2));
            company.setBankAccountCodePath(filePathList.get(3));
            company.setLegalPersonCodePath(filePathList.get(4));
            company.setBussionLicenseCodePath(filePathList.get(5));
            registerModel.saveEnterpriseQualification(company, company.getCompanyId());
        }
        return map;
    }*/

    // 管理员方法
    public User getManagerInfo(HttpServletRequest request, HttpServletResponse response)
    {
        // 获取管理员信息
        String name = org.apache.commons.lang3.StringUtils.defaultString(request.getParameter("name"), "未填 ");
        String password = org.apache.commons.lang3.StringUtils.defaultString(request.getParameter("password"), "未填 ");
        String username = org.apache.commons.lang3.StringUtils.defaultString(request.getParameter("username"), "未填 ");
        String department = org.apache.commons.lang3.StringUtils.defaultString(request.getParameter("department"), "未填 ");
        String phonenumber = org.apache.commons.lang3.StringUtils.defaultString(request.getParameter("phoneNumber"), "未填 ");
        String email = org.apache.commons.lang3.StringUtils.defaultString(request.getParameter("email"), "未填 ");
        String[] permissions = request.getParameterValues("permission");
        String permission = "";
        User manager = new User();
        if (permissions != null && permissions.length > 0)
        {
            for (String p : permissions)
                permission += p + ',';
            permission = permission.substring(0, permission.length() - 1);
            manager.setName(name);
            manager.setPassword(password);
            manager.setPermission(permission);
            manager.setUsername(username);
            manager.setDepartment(department);
            manager.setPhonenumber(phonenumber);
            manager.setEmail(email);
            return manager;
        } else
        {
            msg += "创建失败";
            request.setAttribute("msg", msg);
            return null;
        }
    }

    @RequestMapping("/addmanager")
    public void addManager(HttpServletRequest request, HttpServletResponse response)
    {
        // 增加管理员
        User manager = getManagerInfo(request, response);

        boolean addResult = registerModel.addManager(manager);
        msg += addResult ? "成功创建" : "创建失败";

        request.setAttribute("msg", msg);
        response.setContentType("text/html;charset=UTF-8");
        try
        {
            response.getWriter().print("<script language='javascript'>alert('管理员添加成功！')</script>");
        } catch (IOException e)
        {
            LOGGER.error("页面写出异常", e);
        }
        response.setHeader("refresh", "0;" + request.getContextPath() + "/register/querymanager");
        try
        {
            request.getRequestDispatcher("/register/querymanager").forward(request, response);
        } catch (ServletException | IOException e)
        {
            LOGGER.error("请求转发异常", e);
        }
    }

    @RequestMapping("/querymanager")
    public String queryManager(Model model, HttpServletRequest request)
    {
        List<User> users = null;

        users = registerModel.queryManager();
        Collections.reverse(users);

        // 定义总页数
        int pageCount;
        // 定义管理员列表分页大小(默认每页5条数据)
        final int PAGE_SIZE = 10;
        // 设置当前页为静态变量，便于前端获取并上下页操作
        int currentPage = 1;
        if (users != null && users.size() > 0)
        {
            int size = users.size();
            pageCount = (size % PAGE_SIZE == 0) ? (size / PAGE_SIZE) : (size / PAGE_SIZE + 1);
            currentPage = NumberUtils.toInt(org.apache.commons.lang3.StringUtils.defaultString(request.getParameter("currentPage"), "1"));
            if (currentPage >= pageCount)
            {
                currentPage = pageCount;
            }
            int start = (currentPage - 1) * PAGE_SIZE;
            int end = currentPage * PAGE_SIZE - 1;
            model.addAttribute("users", users);
            model.addAttribute("start", start);
            model.addAttribute("end", end);
            model.addAttribute("pageCount", pageCount);
            model.addAttribute("currentPage", currentPage);
        }
        return "user/superManager";
    }

    @RequestMapping("/deletemanager")
    public void deleteManager(HttpServletRequest request, HttpServletResponse response)
    {
        String id = request.getParameter("id");
        String msg = "";

        boolean result = registerModel.deleteManager(id);
        msg += result ? "成功删除" : "删除失败";

        request.setAttribute("msg", msg);
        try
        {
            request.getRequestDispatcher("/register/querymanager").forward(request, response);
        } catch (ServletException | IOException e)
        {
            LOGGER.error("请求转发异常", e);
        }
    }

    /*
     * 注册校验 对表单的字段进行逐个校验，如果有错误，使用当前字段名称为key，错误信息为value，保存到map中 返回map
     */
    private Map<String, String> validateRegist(HttpServletRequest req, HttpSession session) throws ServletException, IOException
    {
        Map<String, String> errors = new HashMap<String, String>();
        /*
         * 1. 校验登录名
         */
        String loginname = org.apache.commons.lang3.StringUtils.defaultString(req.getParameter("loginname"));
        if (loginname == null || loginname.trim().isEmpty())
        {
            errors.put("loginname", "户名不能为空！");
        } else if (loginname.length() < 3 || loginname.length() > 20)
        {
            errors.put("loginname", "用户名长度必须在3~20之间！");
        } else if (!registerModel.ajaxValidateLoginname(loginname))
        {
            errors.put("loginnameError", "用户名已被注册！");
        }

        /*
         * 2. 校验登录密码
         */
        String loginpass = org.apache.commons.lang3.StringUtils.defaultString(req.getParameter("loginpass"));
        if (loginpass == null || loginpass.trim().isEmpty())
        {
            errors.put("loginpass", "密码不能为空！");
        } else if (loginpass.length() < 3 || loginpass.length() > 20)
        {
            errors.put("loginpass", "密码长度必须在3~20之间！");
        }

        /*
         * 3. 确认密码校验
         */
        String reloginpass = org.apache.commons.lang3.StringUtils.defaultString(req.getParameter("reloginpass"));
        if (reloginpass == null || reloginpass.trim().isEmpty())
        {
            errors.put("reloginpass", "确认密码不能为空！");
        } else if (!reloginpass.equals(loginpass))
        {
            errors.put("reloginpass", "两次输入不一致！");
        }

        /*
         * 11. 验证码校验
         */
        String verifyCode = org.apache.commons.lang3.StringUtils.defaultString(req.getParameter("verifyCode"));
        String vcode = (String) session.getAttribute("vCode");
        if (verifyCode == null || verifyCode.trim().isEmpty())
        {
            errors.put("verifyCode", "验证码不能为空！");
        } else if (!verifyCode.equalsIgnoreCase(vcode))
        {
            errors.put("verifyCode", "验证码错误！");
        }
        return errors;
    }

    private Map<String, String> validateQualifction(HttpServletRequest req, HttpSession session) throws ServletException, IOException
    {
        Map<String, String> errors = new HashMap<String, String>();
        // 4. 校验企业机构代码
        String companyId = org.apache.commons.lang3.StringUtils.defaultString(req.getParameter("companyId"));
        if (companyId == null || companyId.trim().isEmpty())
        {
            errors.put("companyId", "企业机构代码不能为空！");
        } else if (companyId.length() != 18)
        {
            errors.put("companyId", "企业机构代码格式错误！");
        } else if (!registerModel.ajaxValidateCompanyId(companyId))
        {
            errors.put("companyId", "企业机构代码已被注册！");
        }
        // 5. 校验企业名称
        String companyName = org.apache.commons.lang3.StringUtils.defaultString(req.getParameter("companyName"));
        if (companyName == null || companyName.trim().isEmpty())
        {
            errors.put("companyName", "企业机构代码不能为空！");
        } else if (companyName.length() < 3 || companyName.length() > 20)
        {
            errors.put("companyName", "企业名称长度必须在3 ~ 20之间！");
        }
        // 6. 校验法人
        String legalPerson = org.apache.commons.lang3.StringUtils.defaultString(req.getParameter("legalPerson"));
        String legalPersonId = org.apache.commons.lang3.StringUtils.defaultString(req.getParameter("legalPersonId"));
        if (legalPerson == null || legalPerson.trim().isEmpty())
        {
            errors.put("legalPerson", "企业机构代码不能为空！");
        } else if (legalPerson.length() < 2 || legalPerson.length() > 10)
        {
            errors.put("legalPerson", "法人长度必须在2 ~ 10之间！");
        } else if (!legalPersonId.matches(idPattern))
        {
            errors.put("legalPersonId", "身份证不匹配");
        }
        // 7. 校验联系方式
        String phoneNumber = org.apache.commons.lang3.StringUtils.defaultString(req.getParameter("phoneNumber"));
        if ((phoneNumber != null) && (!phoneNumber.trim().isEmpty()))
        {
            errors.put("phoneNumber", "联系方式为固话或手机！");
        }
        // 8. 校验银行账户
        String bankAccount = org.apache.commons.lang3.StringUtils.defaultString(req.getParameter("bankAccount"));
        if ((bankAccount != null) && (!bankAccount.trim().isEmpty()) && ((bankAccount.length() < 18) || (bankAccount.length() > 21)))
        {
            errors.put("bankAccount", "银行账号长度必须在18 ~ 21之间！");
        }
        // 9. 校验营业执照
        String openLicenseId = org.apache.commons.lang3.StringUtils.defaultString(req.getParameter("openLicenseId"));
        if ((openLicenseId != null) && (!openLicenseId.trim().isEmpty()) && (openLicenseId.length() != 13))
        {
            errors.put("openLicenseId", "营业执照长度必须为13位！");
        }
        // 10. 校验税务登记号
        String taxRegisterId = org.apache.commons.lang3.StringUtils.defaultString(req.getParameter("taxRegisterId"));
        if ((taxRegisterId != null) && (!taxRegisterId.trim().isEmpty()) && ((taxRegisterId.length() < 15) || (taxRegisterId.length() > 20)))
        {
            errors.put("taxRegisterId", "税务登记号长度长度必须在15 ~ 20之间！");
        }
        return errors;
    }

    // 上传文件的命名方法 文件命名要求有一个时间戳，此为得到yyyyMMddHHmmss时间的方法。
    protected static String getDate()
    {
        SimpleDateFormat date = new SimpleDateFormat("yyyyMMddHHmmss");
        long now = System.currentTimeMillis();
        return date.format(now);
    }

    @RequestMapping("/doqualification")
    public String doQualification(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ServletException, IOException, SQLException
    {
        return "user/com_qualification";
    }

    @RequestMapping("/getdataMUser")
    @ResponseBody
    public Map<String, Object> getMUserAjax(@RequestParam(value = "offset", required = false) int offset, @RequestParam(value = "limit", required = false) int limit, @RequestParam(value = "sort", required = false) String sort, @RequestParam(value = "order", required = false) String order)
    {
        Map<String, Object> map = new HashMap<>();
        map.put("rows", MUserhandle(offset, limit, sort, order));
        map.put("total", registerModel.getMUserListTotal(sort, order));
        return map;
    }

    public List<User> MUserhandle(int offset, int limit, String sort, String order)
    {
        List<User> userList = registerModel.getMUserList(offset, limit, sort, order);
        for (User user : userList)
        {
            switch (user.getPermission())
            {
                case "4":
                    user.setPermission("资讯编辑管理员");
                    break;
                case "5":
                    user.setPermission("资讯审核管理员");
                    break;
                case "6":
                    user.setPermission("注册审核管理员");
                    break;
                case "7":
                    user.setPermission("交易审核管理员");
                    break;
                case "8":
                    user.setPermission("广告审核管理员");
                    break;
                default:
                    break;
            }
        }
        return userList;
    }

//    // 胡济洲story 企业资质信息修改
//    @RequestMapping("doupdate_company")
//    public String doupdate_Company(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ServletException, IOException, SQLException
//    {
//        Company company = (Company) session.getAttribute("company");
//        // 文件上传部分
//        try
//        {
//            // 判断存放上传文件的目录是否存在（不存在则创建）
//            File f = new File(uploadPath);
//            if (!f.exists() && !f.isDirectory())
//            {
//                f.mkdir();
//            }
//            uploadFile(company, request, response);
//        } catch (FileUploadException e)
//        {
//            LOGGER.error("服务器繁忙，上传文件失败", e);
//            throw new RuntimeException("服务器繁忙，文件上传失败");
//        }
//        // 修改完成，执行查询操作，显示查到的信息
//        return "user/com_qualification";
//    }

//    /**
//     * 使用Apache文件上传组件处理文件上传步骤：
//     */
//    public void uploadFile(Company company, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException, FileUploadException
//    {
//        // 1、设置环境:创建一个DiskFileItemFactory工厂
//        DiskFileItemFactory factory = new DiskFileItemFactory();
//        // 2、核心操作类:创建一个文件上传解析器。
//        ServletFileUpload upload = new ServletFileUpload(factory);
//        upload.setHeaderEncoding("UTF-8");
//        // 3、判断enctype:判断提交上来的数据是否是上传表单的数据
//        if (!ServletFileUpload.isMultipartContent(request))
//        {
//            LOGGER.error("不是上传文件，终止");
//        }
//        // 4、使用ServletFileUpload解析器解析上传数据，解析结果返回的是一个List<FileItem>集合，每一个FileItem对应一个Form表单的输入项
//        List<FileItem> items = upload.parseRequest(request);
//        // 把获取到的表单信息存储在list_company中
//        List<String> list_company = new ArrayList<>();
//        for (FileItem item : items)
//        {
//            // 如果fileitem中封装的是普通输入项的数据（输出名、值）
//            if (item.isFormField())
//            {
//                String filedValue = item.getString("UTF-8");// 普通输入项的值
//                list_company.add(filedValue);
//            }
//            else
//            {
//                // 返回一个新的字符串，它是此字符串的一个子字符串。该子字符串从指定索引处的字符开始，直到此字符串末尾。
//                // suffix为后缀名，初始值设置为上传的文件名。
//                String suffix = item.getContentType();
//                // 获取文件名
//                String fileName = item.getName();
//                // application/octet-stream是二进制流,不知道下载文件类型，即用户未上床文件时的文件类型
//                if (!suffix.equals("application/octet-stream"))
//                {
//                    // 上传文件，读写操作
//                    uploadReadWrite(fileName, suffix, company, item);
//                }
//                // 如果用户没有上传文件，不进行文件操作
//                // 将list中的数据存入company对象
//                request.setCharacterEncoding("utf-8");
//                response.setContentType("text/html;charset=utf-8");
//                // 将list_company中的数据，存进company对象中
//                company.setCompanyName(list_company.get(1));
//                company.setLegalPerson(list_company.get(2));
//                company.setPhoneNumber(list_company.get(3));
//                company.setBankAccount(list_company.get(4));
//                company.setOpenLicenseId(list_company.get(5));
//                company.setTaxRegisterId(list_company.get(6));
//                company.setReviewState(0);
//
//                // 更新数据库中的数据
//                registerModel.updateCompany(company, fileName);
//
//            }
//        }
//    }

//    /**
//     * 上传文件，读写操作 FileName RegisterController.java return void
//     */
//    public void uploadReadWrite(String fileName, String suffix, Company company, FileItem item) throws ServletException, IOException, SQLException, FileUploadException
//    {
//        fileName = company.getCompanyId() + getDate() + "." + suffix.substring(suffix.lastIndexOf("/") + 1);
//        // 处理上传文件的文件名的路径，截取字符串只保留文件名部分。截取留最后一个"\"之后，+1截取向右移一位（"\a.txt"-->"a.txt"）
//        // 拼接上传路径。存放路径+上传的文件名
//        String filePath = realPath + "/" + fileName;
//        // 构建输入输出流
//        // 获取item中的上传文件的输入流
//        InputStream in = item.getInputStream();
//        LOGGER.error("filePath:" + filePath);
//        // 创建一个文件输出流
//        OutputStream out = new FileOutputStream(filePath);
//        // 设置相对路径，按照格式要求，存在数据库中
//        // 将相对路径存入company对象
//        String relative_path = FILE_PATH + fileName;
//        company.setOpenLicensePath(relative_path);
//        // 创建一个缓冲区
//        byte b[] = new byte[1024];
//        // 判断输入流中的数据是否已经读完的标识
//        int len = -1;
//        // 循环将输入流读入到缓冲区当中，(len=in.read(buffer))！=-1就表示in里面还有数据
//        while ((len = in.read(b)) != -1)
//        {
//            // 没数据了返回-1
//            out.write(b, 0, len);
//        }
//        // 关闭流
//        out.close();
//        in.close();
//        // 删除临时文件
//        try
//        {
//            Thread.sleep(3000);
//        } catch (InterruptedException e)
//        {
//            LOGGER.info("线程内部中断", e);
//        }
//        // 删除处理文件上传时生成的临时文件
//        item.delete();
//        LOGGER.error("文件上传成功");
//    }
}
