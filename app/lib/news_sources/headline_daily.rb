# http://www.iread-hd.com/iReadServer/ImageForFlash.ashx?ProductCode=Headline&PubKey=2012091200&DeviceType=6&PageNo=1&DeviceID=flash1977986851&AppVersion=1-0&PageType=I&Token=e0acdbacacb3aaaeb2aedeaab3afdeaa
# http://paper.hkheadline.com/headline/?date=2012-09-08&page=1&pubkey=2012090800
# module NewsSources
#   class HeadlineDaily < NewsSource
#     source "headline"

#     def is_available?
#       !(@image.nil?)
#     end

#     def source_image_url
#       @source_image_url ||= image_url
#     end

#     def link_url
#       @link_url ||= @date.strftime("http://paper.hkheadline.com/headline/?date=%Y-%m-%d&page=1&pubkey=%Y%m%d00")
#     end

#     private
#     def image_url
#       @date.strftime("http://www.iread-hd.com/iReadServer/ImageForFlash.ashx?ProductCode=Headline&PubKey=%Y%m%d0000&DeviceType=6&PageNo=1&DeviceID=flash1977986851&AppVersion=1-0&PageType=I&Token=aeaeadabaeb0b2b3acdcdeaeb1afaeaa")
#     end

#     def image
#       @image ||= open(image_url) rescue nil
#     end
#   end
# end
