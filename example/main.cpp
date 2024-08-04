#include <cstdio>
#include <opencv2/opencv.hpp>
#include <iostream>

int main() {
    // 创建一个黑色的图片（所有像素值为0）
    cv::Mat blackImage = cv::Mat::zeros(480, 640, CV_8UC3);
    cv::imwrite("black_image.jpg", blackImage);
    std::cout << "Generate black_image.jpg successful" << std::endl;
    getchar();
    return 0;
}
