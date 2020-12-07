package com.website.quanlybanhang.service;

import org.springframework.web.multipart.MultipartFile;

public interface ImageService {
	String uploadFile(String uploadRootPath, MultipartFile file);
}
