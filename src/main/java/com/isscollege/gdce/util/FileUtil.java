package com.isscollege.gdce.util;

import org.apache.log4j.Logger;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

public class FileUtil
{
    private static final Logger LOGGER = Logger.getLogger(FileUtil.class);

    /**
     * 读取文件（读取文件字节信息，建议读取二进制文件）
     *
     * @param filePath 文件路径
     * @return 返回文件二进制信息
     */
    public static byte[] readFile(String filePath)
    {
        byte[] fileData = null;
        FileInputStream fis = null;
        try
        {
            fis = new FileInputStream(filePath);
            int bufferLength = fis.available();
            fileData = new byte[bufferLength];
            fis.read(fileData);
        } catch (Exception e)
        {
            LOGGER.error(filePath + "文件不存在！", e);
        } finally
        {
            try
            {
                if (null != fis)
                {
                    fis.close();
                }
            } catch (IOException e)
            {
                LOGGER.error("Input close error!", e);
            }
        }
        return fileData;
    }


    public static void writeFile(File realPathFile, String filePath, MultipartFile file)
    {
        if (!realPathFile.exists())
        {
            realPathFile.mkdirs();
        }
        try
        {
            File targetFile = new File(filePath);
            file.transferTo(targetFile);
        } catch (IOException e)
        {
            LOGGER.error("Write error!",e);
        }

    }
}
