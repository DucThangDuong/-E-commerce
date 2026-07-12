-- ============================================================
-- 1. FeatureGroups
-- ============================================================
INSERT INTO FeatureGroups (group_name, display_order)
VALUES (N'Thiết kế', 1), (N'Động cơ', 2), (N'Tiện ích', 3), (N'An toàn', 4);
GO
DECLARE @base VARCHAR(200) = 'https://imageshare13.blob.core.windows.net/features/';

-- ============================================================
-- SẢN PHẨM 1: Honda Wave Alpha
-- ============================================================
-- ============================================================
INSERT INTO Features (feature_group_id, product_id, Name, Description, image_url, display_order) VALUES
(1, 1, N'Thiết kế tổng thể nhỏ gọn', N'Wave Alpha sở hữu dáng vẻ truyền thống với kích thước 1.914x688x1.072mm, mặt nạ trước đơn giản, cụm đèn pha halogen bền bỉ, yên xe dài thấp phù hợp vóc dáng người Việt.', @base + 'tem-xe.jpg', 0),
(1, 1, N'Cụm đồng hồ analog trực quan', N'Bảng đồng hồ dạng cơ với mặt số tốc độ lớn, đèn báo xăng rõ ràng dưới ánh sáng ban ngày, thiết kế đơn giản đầy đủ thông tin.', @base + 'dong-ho-analog.jpg', 1),
(1, 1, N'Đèn hậu và xi-nhan liền khối', N'Cụm đèn hậu tích hợp xi-nhan hai bên tạo khối thống nhất, bóng halogen cho ánh sáng ổn định, tiết kiệm chi phí thay thế.', @base + 'den-hau-led.jpg', 2),
(2, 1, N'Động cơ 110cc eSP làm mát bằng gió', N'Khối động cơ xy-lanh đơn 109.1cc, 4 kỳ, làm mát bằng không khí cưỡng bức, ứng dụng công nghệ eSP (Enhanced Smart Power) giúp giảm ma sát nội bộ thông qua các chi tiết như xi-lanh offset, piston nhẹ, bề mặt xy-lanh được gia công tinh xảo, cùng hệ thống phun xăng điện tử PGM-FI thế hệ mới. Công suất tối đa 6,12 mã lực tại 7.500 vòng/phút và mô-men xoắn cực đại 8,44 Nm tại 5.500 vòng/phút. Nhờ buồng đốt được tối ưu hóa và quạt làm mát cưỡng bức, động cơ luôn duy trì nhiệt độ lý tưởng, giúp tiết kiệm nhiên liệu vượt trội (khoảng 1,7 lít/100km) ngay cả khi di chuyển liên tục trong phố đông. Hệ thống khởi động điện ACG tích hợp giúp khởi động êm ái không tiếng ồn, tăng độ bền cho bộ đề.', @base + 'dong-co-xe-so-ga.jpg', 0),
(3, 1, N'Hệ thống khóa cơ đa năng bền bỉ', N'Ổ khóa thiết kế chống nước, chống bụi đạt chuẩn, tích hợp khóa từ chống trộm cơ bản, khóa cổ và mở cốp. Cơ cấu thuần cơ khí giúp giảm thiểu hỏng hóc do ẩm ướt hay va đập, phù hợp với điều kiện thời tiết nhiệt đới. Chìa khóa có rãnh mã hóa chống sao chép trái phép.', @base + 'chong-trom-co.jpg', 0),
(3, 1, N'Cốp nhỏ đựng đồ cá nhân', N'Dung tích cốp tuy khiêm tốn nhưng được thiết kế sâu, đủ chứa mũ bảo hiểm nửa đầu, áo mưa gọn nhẹ và giấy tờ xe. Nắp cốp mở bằng nút bấm cơ học đặt bên hông thân xe, thao tác một tay dễ dàng, có gioăng cao su chống nước lọt vào bên trong.', @base + 'cop-nho.jpg', 1),
(3, 1, N'Móc treo đồ phía trước chịu lực', N'Móc treo bằng thép không gỉ đặt chìm ở mặt nạ trước, chịu tải lên đến 5kg, có nắp che khi không dùng giúp giữ thẩm mỹ. Khi treo đồ, móc tự động khóa nhẹ để tránh tuột túi khi xe di chuyển qua đường xóc.', @base + 'moc-treo.jpg', 2),
(4, 1, N'Hệ thống phanh cơ trước sau', N'Xe sử dụng phanh tang trống cả hai bánh, lực phanh vừa đủ cho tốc độ đô thị, chi phí bảo dưỡng thấp và dễ sửa chữa.', @base + 'phanh-dia-abs.jpg', 0),
(4, 1, N'Giảm xóc trước dạng ống lồng', N'Giảm xóc trước ống lồng thủy lực hành trình 100mm giúp hấp thụ rung động tốt trên đường gồ ghề, mang lại cảm giác êm ái cho người lái.', @base + 'giam-xoc-tru-doi.jpg', 1),
(4, 1, N'Lốp có săm truyền thống', N'Lốp 70/90-17 trước, 80/90-17 sau có săm, phổ biến, dễ vá và sửa chữa ven đường, phù hợp điều kiện hạ tầng Việt Nam.', @base + 'lop-khong-sam.jpg', 2);

-- SẢN PHẨM 2: Yamaha Sirius
-- ============================================================
-- ============================================================
INSERT INTO Features (feature_group_id, product_id, Name, Description, image_url, display_order) VALUES
(1, 2, N'Kiểu dáng thể thao trẻ trung', N'Sirius có thiết kế vuốt nhọn từ đầu đến đuôi, mặt nạ trước góc cạnh, đèn pha halogen tạo hình sắc sảo cùng tem xe nổi bật.', @base + 'tem-xe.jpg', 0),
(1, 2, N'Đồng hồ kỹ thuật số hiện đại', N'Màn hình LCD hiển thị tốc độ, quãng đường, đèn báo xăng và thay nhớt, thiết kế gọn gàng, dễ đọc trong nắng.', @base + 'dong-ho-lcd.jpg', 1),
(1, 2, N'Đèn hậu LED hình chữ X', N'Cụm đèn hậu LED định hình chữ X độc đáo, cho ánh sáng nhanh, bền, tiết kiệm điện.', @base + 'den-hau-led.jpg', 2),
(2, 2, N'Động cơ 110cc Blue Core làm mát bằng gió', N'Khối động cơ xy-lanh đơn 113.7cc, 4 kỳ, làm mát bằng không khí, áp dụng công nghệ Blue Core thế hệ mới nhất với mục tiêu tăng hiệu suất đốt cháy, giảm ma sát và giảm thất thoát năng lượng. Các chi tiết như xi-lanh DiASil (nhôm đúc có lớp phủ silicon carbide) siêu cứng, piston nhẹ với váy piston được tối ưu hóa, trục khuỷu cân bằng chính xác, cùng hệ thống phun xăng điện tử Fi phản ứng nhanh giúp tiết kiệm nhiên liệu ở mức 1,57 lít/100km. Công suất tối đa 6,7 kW tại 7.500 vòng/phút, mô-men xoắn cực đại 9,2 Nm tại 5.500 vòng/phút. Hệ thống làm mát cưỡng bức bằng quạt giúp động cơ luôn ở nhiệt độ lý tưởng, bảo vệ các chi tiết bên trong, kéo dài tuổi thọ.', @base + 'dong-co-xe-so-ga.jpg', 0),
(3, 2, N'Cốp rộng 10,5 lít tiện lợi', N'Cốp dưới yên có hình dạng tối ưu, chứa vừa mũ bảo hiểm nửa đầu cùng áo mưa và các vật dụng nhỏ. Nắp cốp có bản lề chắc chắn, mở nhẹ nhàng bằng cần gạt cơ học đặt cạnh ổ khóa. Bên trong lót một lớp nỉ mỏng chống trầy đồ vật.', @base + 'cop-nho.jpg', 0),
(3, 2, N'Móc treo đồ chịu lực lên đến 3kg', N'Móc treo thiết kế dạng mỏ vịt có rãnh khóa, khi treo túi sẽ tự động ghì chặt, hạn chế rơi rớt. Vị trí đặt thấp, thuận tiện treo túi xách, cặp sách mà không ảnh hưởng đến tầm quan sát hay điều khiển.', @base + 'moc-treo.jpg', 1),
(3, 2, N'Hệ thống khóa đa năng tích hợp', N'Ổ khóa cơ 3 trong 1: khóa điện, khóa cổ, mở cốp. Chìa khóa có chip từ chống trộm cơ bản, vỏ ổ khóa được bọc thép chống cắt, chịu được lực tác động từ búa hay kìm cộng lực.', @base + 'chong-trom-co.jpg', 2),
(4, 2, N'Phanh đĩa trước thủy lực', N'Đĩa phanh đường kính 220mm kết hợp kẹp piston đơn, cho lực phanh mạnh mẽ và ổn định.', @base + 'phanh-dia-abs.jpg', 0),
(4, 2, N'Hệ thống giảm xóc linh hoạt', N'Giảm xóc trước ống lồng và giảm xóc sau lò xo trụ đôi giúp ổn định thân xe khi vào cua.', @base + 'giam-xoc-tru-doi.jpg', 1),
(4, 2, N'Lốp không săm thể thao', N'Lốp 70/90-17 trước, 80/90-17 sau không săm, hạn chế rủi ro nổ lốp đột ngột.', @base + 'lop-khong-sam.jpg', 2);

-- SẢN PHẨM 3: Honda Vision
-- ============================================================
-- ============================================================
INSERT INTO Features (feature_group_id, product_id, Name, Description, image_url, display_order) VALUES
(1, 3, N'Thiết kế thanh lịch, nữ tính', N'Vision với những đường cong mềm mại, mặt nạ mạ chrome, yên xe thấp 760mm, tổng thể nhỏ gọn phù hợp phụ nữ.', @base + 'tem-xe.jpg', 0),
(1, 3, N'Cụm đèn LED đồng bộ', N'Đèn pha LED và đèn định vị LED ban ngày, cường độ sáng cao, tiết kiệm năng lượng, thẩm mỹ hiện đại.', @base + 'den-pha-led.jpg', 1),
(1, 3, N'Đồng hồ analog kết hợp LCD', N'Bảng đồng hồ mặt số analog quen thuộc, màn hình LCD nhỏ hiển thị quãng đường và mức xăng.', @base + 'dong-ho-analog.jpg', 2),
(2, 3, N'Động cơ eSP 110cc làm mát bằng gió', N'Động cơ 109.1cc, 4 kỳ, xi-lanh đơn, làm mát bằng không khí cưỡng bức, áp dụng công nghệ eSP (Enhanced Smart Power) với hàng loạt cải tiến: xi-lanh offset giúp giảm lực ngang tác động lên piston, giảm ma sát; bề mặt xi-lanh được mài nhẵn siêu mịn; piston trọng lượng nhẹ và vòng gạt dầu hiệu suất cao. Hệ thống phun xăng điện tử PGM-FI tính toán chính xác lượng nhiên liệu theo nhiệt độ động cơ, độ cao và tải trọng, đảm bảo đốt cháy hoàn toàn. Công suất 6,29 kW tại 7.500 vòng/phút, mô-men xoắn 8,3 Nm tại 5.500 vòng/phút, tiêu hao nhiên liệu chỉ 1,83 lít/100km. Bộ đề ACG khởi động không tiếng ồn, tích hợp máy phát điện, giảm số lượng chi tiết, tăng độ tin cậy.', @base + 'dong-co-xe-so-ga.jpg', 0),
(3, 3, N'Cốp rộng 18 lít nhất phân khúc', N'Khoang chứa đồ dưới yên có thiết kế phẳng, sâu, chứa được 1 mũ bảo hiểm 3/4 cùng áo mưa, túi xách nhỏ. Nắp cốp mở bằng nút bấm hoặc qua smartkey, có gioăng cao su ngăn nước và bụi. Sàn để chân rộng rãi, có thể đặt thêm túi đồ.', @base + 'cop-nho.jpg', 0),
(3, 3, N'Hệ thống khóa thông minh Smartkey', N'Smartkey Honda thế hệ mới giao tiếp không dây tầm ngắn, tự động nhận diện khi người lái đến gần. Xoay núm để mở khóa điện, khóa cổ, mở cốp; nút trả lời giúp tìm xe trong bãi đỗ bằng âm thanh và đèn nháy. Có chế độ tiết kiệm pin, tự động ngắt khi không sử dụng.', @base + 'smartkey.jpg', 1),
(3, 3, N'Nắp bình xăng tiện lợi phía trước', N'Vị trí nắp xăng đặt ở mặt nạ trước, mở bằng nút bấm ngay tay lái, không cần xuống xe khi đổ xăng. Nắp có bản lề lò xo, đóng mở nhẹ nhàng, gioăng kín ngăn mùi xăng.', @base + 'nap-xang-truoc.jpg', 2),
(4, 3, N'Phanh CBS kết hợp an toàn', N'Hệ thống phanh kết hợp Combi Brake phân bổ lực phanh hợp lý giữa bánh trước và bánh sau chỉ với một tay phanh.', @base + 'phanh-dia-abs.jpg', 0),
(4, 3, N'Giảm xóc sau lò xo trụ đơn', N'Giảm xóc sau với 3 cấp điều chỉnh tải trọng, giúp xe vận hành êm ái ngay cả khi chở thêm người.', @base + 'giam-xoc-tru-doi.jpg', 1),
(4, 3, N'Lốp không săm bản lớn', N'Lốp 80/90-14 trước, 90/90-14 sau không săm, tăng độ bám đường và an toàn hơn.', @base + 'lop-khong-sam.jpg', 2);

-- SẢN PHẨM 4: Yamaha Janus
-- ============================================================
-- ============================================================
INSERT INTO Features (feature_group_id, product_id, Name, Description, image_url, display_order) VALUES
(1, 4, N'Thiết kế vuốt cao tôn dáng', N'Janus mang phong cách thời trang với thân xe thon gọn, đuôi vuốt cao, đèn pha LED hình chữ Y và tem xe sang trọng.', @base + 'tem-xe.jpg', 0),
(1, 4, N'Màn hình LCD toàn phần', N'Đồng hồ kỹ thuật số hiển thị tốc độ, mức xăng, hành trình, đồng hồ, bố trí rõ ràng trên màn hình sắc nét.', @base + 'dong-ho-lcd.jpg', 1),
(1, 4, N'Đèn hậu LED dạng chữ Y', N'Cụm đèn hậu LED thiết kế theo ngôn ngữ chữ Y, ánh sáng phản xạ nhanh, nổi bật khi phanh.', @base + 'den-hau-led.jpg', 2),
(2, 4, N'Động cơ Blue Core 125cc Stop & Start', N'Khối động cơ xy-lanh đơn 125cc, 4 kỳ, làm mát bằng không khí cưỡng bức, ứng dụng công nghệ Blue Core với xi-lanh DiASil, piston siêu nhẹ và trục khuỷu cân bằng động. Đặc biệt, hệ thống Stop & Start (SSS) sẽ tự động ngắt động cơ sau 3 giây dừng đèn đỏ và khởi động lại cực êm chỉ bằng thao tác vặn ga, nhờ bộ đề tích hợp máy phát ACG không chổi than. Hệ thống phun xăng điện tử Fi phản ứng nhanh, kết hợp cảm biến ô-xy giúp tối ưu tỉ lệ hòa khí. Công suất tối đa 7,0 kW tại 8.000 vòng/phút, mô-men xoắn 9,5 Nm tại 5.500 vòng/phút, tiêu hao nhiên liệu khoảng 1,6 lít/100km. Công nghệ này không chỉ tiết kiệm xăng mà còn giảm phát thải CO2, thân thiện môi trường.', @base + 'dong-co-xe-so-ga.jpg', 0),
(3, 4, N'Cốp dung tích 11,2 lít', N'Khoang chứa đồ dưới yên được thiết kế sâu, đủ chứa mũ bảo hiểm nửa đầu cùng áo mưa, sách vở. Nắp cốp mở bằng nút bấm cơ học tích hợp trong ổ khóa, hoạt động nhẹ nhàng.', @base + 'cop-nho.jpg', 0),
(3, 4, N'Móc treo và hộc để đồ nhỏ', N'Xe có móc treo phía trước chịu lực 3kg, kèm hộc nhỏ có nắp đậy bên trong mặt nạ, đủ để chai nước 500ml hoặc điện thoại, bên trong lót nỉ chống trầy.', @base + 'moc-treo.jpg', 1),
(3, 4, N'Khóa thông minh Smartkey Yamaha', N'Hệ thống khóa thông minh không cần chìa cơ, chỉ cần mang fob trong người. Xoay núm để bật/tắt máy, mở cốp, khóa cổ. Có nút tìm xe phát tín hiệu âm thanh và đèn nháy, phạm vi nhận diện khoảng 1,5m.', @base + 'smartkey.jpg', 2),
(4, 4, N'Phanh CBS trước đĩa, sau tang trống', N'Phanh đĩa thủy lực phía trước và tang trống phía sau, tích hợp CBS phân bổ lực phanh.', @base + 'phanh-dia-abs.jpg', 0),
(4, 4, N'Hệ thống treo êm ái', N'Giảm xóc trước ống lồng, sau lò xo trụ đôi điều chỉnh được, hấp thụ xóc tốt.', @base + 'giam-xoc-tru-doi.jpg', 1),
(4, 4, N'Lốp không săm với rãnh gai sâu', N'Lốp 70/90-14 trước, 80/90-14 sau không săm, hoa văn gai sâu giúp thoát nước tốt.', @base + 'lop-khong-sam.jpg', 2);

-- SẢN PHẨM 5: Honda Lead
-- ============================================================
-- ============================================================
INSERT INTO Features (feature_group_id, product_id, Name, Description, image_url, display_order) VALUES
(1, 5, N'Thiết kế sang trọng, bề thế', N'Lead với thân xe to bản, mặt nạ mạ chrome lớn, đèn pha LED sắc sảo và yên xe rộng rãi, toát lên vẻ đẳng cấp.', @base + 'tem-xe.jpg', 0),
(1, 5, N'Đồng hồ hiện đại', N'Bảng đồng hồ analog kết hợp màn hình LCD hiển thị mức xăng, quãng đường và đèn báo Idling Stop.', @base + 'dong-ho-analog.jpg', 1),
(1, 5, N'Đuôi xe vuốt thanh thoát', N'Phần đuôi cao, cụm đèn hậu LED xếp chồng tạo hiệu ứng 3D, tăng nhận diện.', @base + 'den-hau-led.jpg', 2),
(2, 5, N'Động cơ eSP+ 125cc làm mát bằng dung dịch', N'Khối động cơ xy-lanh đơn 124,9cc, 4 kỳ, làm mát bằng chất lỏng tuần hoàn cưỡng bức với két nước đặt phía trước, tích hợp công nghệ eSP+ (Enhanced Smart Power Plus). Công nghệ này bao gồm xi-lanh offset, piston trọng lượng nhẹ phủ carbon chống mài mòn, bề mặt xi-lanh gia công chính xác đến micromet, hệ thống van nạp/xả tối ưu góc mở, cùng hệ thống phun xăng PGM-FI phản ứng nhanh. Động cơ đạt công suất 8,2 kW tại 8.500 vòng/phút và mô-men xoắn 11,3 Nm tại 5.000 vòng/phút. Hệ thống Idling Stop tự động ngắt động cơ khi dừng đèn đỏ, sau đó khởi động lại tức thì không gây rung giật nhờ bộ đề ACG. Làm mát bằng dung dịch giúp nhiệt độ động cơ ổn định ngay cả khi chạy đường dài, tiêu hao nhiên liệu chỉ 1,96 lít/100km.', @base + 'dong-co-xe-so-ga.jpg', 0),
(3, 5, N'Cốp siêu rộng 37 lít', N'Khoang chứa đồ khổng lồ dưới yên có thể chứa cùng lúc hai mũ bảo hiểm full-face và nhiều đồ đạc khác. Cốp được lót thảm nỉ chống trầy, có đèn LED chiếu sáng khi mở nắp. Nắp cốp đóng mở bằng nút bấm hoặc smartkey, trang bị bản lề thủy lực giảm chấn.', @base + 'cop-lon.jpg', 0),
(3, 5, N'Hệ thống khóa thông minh Smartkey', N'Smartkey Honda thế hệ mới với khả năng chống trộm nâng cao: mã hóa tín hiệu rolling code, không thể bắt sóng sao chép. Núm xoay có đèn LED báo trạng thái, cho phép mở khóa, khóa cổ, mở cốp và tìm xe trong bãi. Khi fob hết pin, vẫn có thể khởi động bằng cách áp fob vào vị trí cảm ứng.', @base + 'smartkey.jpg', 1),
(3, 5, N'Công nghệ Idling Stop tiết kiệm nhiên liệu', N'Hệ thống tự động ngắt động cơ sau 3 giây dừng xe (khi động cơ đạt nhiệt độ hoạt động) nhằm tiết kiệm nhiên liệu và giảm khí thải. Khi người lái vặn ga, động cơ khởi động lại cực êm chỉ trong 0,3 giây nhờ bộ đề tích hợp máy phát ACG không chổi than, không gây tiếng ồn hay rung lắc khó chịu.', @base + 'cong-nghe-dac-biet.jpg', 2),
(4, 5, N'Phanh CBS đĩa trước', N'Hệ thống phanh kết hợp với phanh đĩa thủy lực đường kính lớn ở bánh trước, tăng lực phanh và độ ổn định.', @base + 'phanh-dia-abs.jpg', 0),
(4, 5, N'Giảm xóc sau lò xo trụ đôi', N'Giảm xóc sau có 3 nấc điều chỉnh, giúp xe êm ái khi chở nặng.', @base + 'giam-xoc-tru-doi.jpg', 1),
(4, 5, N'Lốp không săm cỡ lớn', N'Lốp trước 90/90-12, sau 100/90-10 không săm, tăng độ bám và an toàn.', @base + 'lop-khong-sam.jpg', 2);

-- SẢN PHẨM 6: Yamaha Exciter 155
-- ============================================================
-- ============================================================
INSERT INTO Features (feature_group_id, product_id, Name, Description, image_url, display_order) VALUES
(1, 6, N'Thiết kế côn tay thể thao', N'Exciter 155 mang ngôn ngữ thiết kế R-series, bình xăng cơ bắp, đuôi vểnh cao, đèn pha LED đôi sắc lạnh.', @base + 'tem-xe.jpg', 0),
(1, 6, N'Đồng hồ Full LCD', N'Màn hình LCD toàn phần hiển thị vòng tua, tốc độ, mức xăng, hành trình, đồng hồ, giao diện thể thao.', @base + 'dong-ho-lcd.jpg', 1),
(1, 6, N'Cặp đèn hậu LED kiểu mới', N'Đèn hậu LED mỏng vuốt nhọn như đuôi cá mập, xi-nhan LED tách rời.', @base + 'den-hau-led.jpg', 2),
(2, 6, N'Động cơ 155cc VVA làm mát bằng dung dịch', N'Khối động cơ xy-lanh đơn 155,1cc, 4 kỳ, 4 van, SOHC, làm mát bằng chất lỏng tuần hoàn, tích hợp công nghệ Van biến thiên VVA (Variable Valve Actuation) – hệ thống thay đổi biên độ nâng van nạp theo tốc độ vòng tua để tối ưu mô-men xoắn ở vòng tua thấp và công suất ở vòng tua cao. Ở vòng tua thấp và trung bình, van nạp hoạt động với biên độ nâng thấp giúp tiết kiệm nhiên liệu, tăng mô-men; khi vòng tua cao, biên độ nâng lớn hơn để nạp đầy hỗn hợp, tăng công suất. Công suất tối đa 13,2 kW tại 10.000 vòng/phút, mô-men xoắn cực đại 14,2 Nm tại 8.000 vòng/phút. Hộp số 6 cấp với ly hợp ướt đa đĩa, đi kèm bộ ly hợp chống trượt Assist & Slipper, giảm lực kéo phanh động cơ khi dồn số gấp, chống bó bánh sau.', @base + 'dong-co-phan-khoi-lon.jpg', 0),
(2, 6, N'Hệ thống phun xăng điện tử Fi', N'Hệ thống phun xăng điện tử sử dụng cảm biến vị trí bướm ga, cảm biến nhiệt độ khí nạp, cảm biến ô-xy để điều chỉnh lượng xăng phun chính xác theo từng chu kỳ, đảm bảo đốt cháy hoàn toàn, giảm phát thải, tăng phản ứng ga.', @base + 'cong-nghe-dac-biet.jpg', 1),
(3, 6, N'Cốp nhỏ gọn', N'Dung tích cốp dưới yên vừa đủ chứa áo mưa, giấy tờ, phù hợp phong cách thể thao. Nắp cốp tháo rời nhanh chóng bằng chìa khóa.', @base + 'cop-nho.jpg', 0),
(3, 6, N'Công tắc điều khiển tiện lợi', N'Cụm công tắc tay lái tích hợp nút đèn passing, đèn hazard, đề điện và còi, bố trí hợp lý, dễ thao tác ngay cả khi đeo găng tay dày.', @base + 'cong-tac-tay-lai.jpg', 1),
(3, 6, N'Chân chống bên an toàn', N'Chân chống bên tích hợp công tắc ngắt động cơ: khi chân chống chưa gạt lên, động cơ không thể khởi động, ngăn ngừa tai nạn do quên chân chống.', @base + 'chan-chong-an-toan.jpg', 2),
(4, 6, N'Phanh đĩa trước sau với ABS', N'Phanh đĩa thủy lực cả hai bánh, kèm ABS chống bó cứng, tăng an toàn khi phanh gấp.', @base + 'phanh-dia-abs.jpg', 0),
(4, 6, N'Giảm xóc Monocross thể thao', N'Giảm xóc sau dạng Monocross kết hợp giảm xóc trước ống lồng đường kính lớn, ổn định khi ôm cua.', @base + 'giam-xoc-tru-doi.jpg', 1),
(4, 6, N'Lốp thể thao không săm', N'Lốp trước 90/80-17, sau 120/70-17 không săm, gai lốp thể thao bám đường cao.', @base + 'lop-khong-sam.jpg', 2);

-- SẢN PHẨM 7: Honda Winner X
-- ============================================================
-- ============================================================
INSERT INTO Features (feature_group_id, product_id, Name, Description, image_url, display_order) VALUES
(1, 7, N'Thiết kế côn tay thể thao sắc bén', N'Winner X khoác lên mình diện mạo hầm hố với các đường cắt xẻ góc cạnh, mặt nạ trước tạo hình chữ V sắc sảo cùng cụm đèn pha LED đôi tách biệt. Bình xăng cơ bắp và yên xe hai tầng thể thao mang đậm DNA superbike.', @base + 'tem-xe.jpg', 0),
(1, 7, N'Đồng hồ LCD toàn phần hiện đại', N'Màn hình kỹ thuật số LCD hiển thị đầy đủ thông số: tốc độ, vòng tua máy, mức xăng, quãng đường và đồng hồ. Ánh sáng nền màu trắng - xanh nổi bật, dễ đọc cả ngày lẫn đêm.', @base + 'dong-ho-lcd.jpg', 1),
(1, 7, N'Cụm đèn hậu LED tạo hình chữ W', N'Đèn hậu LED thiết kế dạng cánh chim ấn tượng, xi-nhan LED tách rời sắc nét, tăng cường khả năng nhận diện và vẻ thể thao từ phía sau.', @base + 'den-hau-led.jpg', 2),
(2, 7, N'Động cơ DOHC 150cc làm mát dung dịch', N'Trái tim của Winner X là khối động cơ xy-lanh đơn 149.1cc, 4 kỳ, DOHC, 4 van, làm mát bằng chất lỏng tuần hoàn cưỡng bức, sử dụng két nước hiệu suất cao. Cấu trúc DOHC (Double Overhead Camshaft) với hai trục cam trên đỉnh máy giúp điều khiển van nạp và xả độc lập, tối ưu hóa thời điểm đóng/mở van, tăng hiệu suất nạp khí ở vòng tua cao. Công suất cực đại 11,3 kW tại 9.000 vòng/phút và mô-men xoắn 13,5 Nm tại 6.500 vòng/phút, mang lại khả năng tăng tốc mạnh mẽ từ dải tua thấp đến cao. Hộp số 6 cấp mượt mà với ly hợp ướt đa đĩa giúp sang số nhanh, chính xác. Hệ thống phun xăng điện tử PGM-FI với cảm biến nhiệt độ khí nạp, cảm biến vị trí bướm ga và cảm biến ô-xy giúp duy trì tỉ lệ hòa khí lý tưởng, tiết kiệm nhiên liệu (khoảng 1,7 lít/100km) và giảm phát thải.', @base + 'dong-co-phan-khoi-lon.jpg', 0),
(2, 7, N'Hệ thống làm mát bằng dung dịch tối ưu', N'Làm mát bằng chất lỏng với bơm nước dẫn động cơ khí, két nước nhôm mỏng nhẹ và quạt làm mát điện tử giúp kiểm soát nhiệt độ động cơ chính xác, cho phép vận hành bền bỉ trong điều kiện tải nặng hoặc thời tiết nóng ẩm kéo dài.', @base + 'he-thong-lam-mat.jpg', 1),
(3, 7, N'Cốp chứa đồ tiện dụng', N'Dung tích cốp dưới yên tuy không lớn nhưng được thiết kế thông minh, đủ chứa áo mưa, khăn lau và các vật dụng cá nhân nhỏ gọn. Yên sau có thể tháo rời để tăng không gian chứa đồ khi cần.', @base + 'cop-nho.jpg', 0),
(3, 7, N'Nút đèn Hazard và passing', N'Tích hợp đèn cảnh báo khẩn cấp Hazard và nút nháy đèn Passing trên cụm công tắc tay lái, tăng an toàn và tiện lợi khi cần ra hiệu cho xe khác trong điều kiện thời tiết xấu hoặc ban đêm.', @base + 'cong-tac-tay-lai.jpg', 1),
(3, 7, N'Ổ khóa đa năng chống trộm', N'Khóa cơ tích hợp khóa từ chống trộm, khóa cổ và mở yên trong cùng một ổ, vận hành bền bỉ. Chìa khóa có rãnh mã hóa phức tạp, chống sao chép trái phép, đảm bảo an ninh cho xe.', @base + 'chong-trom-co.jpg', 2),
(4, 7, N'Phanh đĩa trước/sau với ABS', N'Phanh đĩa thủy lực cả bánh trước và sau, phiên bản cao cấp có ABS chống bó cứng phanh, giúp kiểm soát phanh tốt hơn trên bề mặt trơn trượt.', @base + 'phanh-dia-abs.jpg', 0),
(4, 7, N'Giảm xóc USD hành trình ngược', N'Giảm xóc trước dạng Upside Down (USD) đường kính 37mm, hành trình lớn, kết hợp giảm xóc sau Monoshock, độ ổn định cao khi vào cua.', @base + 'giam-xoc-tru-doi.jpg', 1),
(4, 7, N'Lốp không săm thể thao bám đường', N'Lốp trước 90/80-17, lốp sau 120/70-17 không săm, gai lốp thể thao tối ưu cho khả năng bám cua và phanh an toàn.', @base + 'lop-khong-sam.jpg', 2);

-- SẢN PHẨM 8: Honda Air Blade
-- ============================================================
-- ============================================================
INSERT INTO Features (feature_group_id, product_id, Name, Description, image_url, display_order) VALUES
(1, 8, N'Thiết kế nam tính, góc cạnh', N'Air Blade thế hệ mới mang phong cách thể thao mạnh mẽ với các đường nét dập nổi cơ bắp, mặt nạ trước góc cạnh, đèn pha LED sắc lạnh và yên xe tạo dáng thể thao.', @base + 'tem-xe.jpg', 0),
(1, 8, N'Đồng hồ LCD hiện đại', N'Bảng đồng hồ kỹ thuật số LCD hiển thị tốc độ, mức xăng, quãng đường, thời gian và các đèn cảnh báo. Thiết kế gọn gàng, ánh sáng nền trắng dễ đọc.', @base + 'dong-ho-lcd.jpg', 1),
(1, 8, N'Cụm đèn hậu LED 3D', N'Đèn hậu LED tạo hình khối 3D sống động, xi-nhan tách rời dạng LED, tăng độ nhận diện và thời trang.', @base + 'den-hau-led.jpg', 2),
(2, 8, N'Động cơ eSP+ 125cc làm mát dung dịch', N'Khối động cơ xy-lanh đơn 124,8cc, 4 kỳ, làm mát bằng chất lỏng tuần hoàn, tích hợp công nghệ eSP+ (Enhanced Smart Power Plus) với xi-lanh offset giảm ma sát, piston nhẹ phủ lớp chống mài mòn và hệ thống phun xăng PGM-FI. Công suất tối đa 8,2 kW tại 8.500 vòng/phút và mô-men xoắn 11,3 Nm tại 5.000 vòng/phút. Hệ thống Idling Stop tự động ngắt động cơ khi dừng xe quá 3 giây, khởi động lại êm ái nhờ bộ đề ACG không chổi than. Làm mát bằng dung dịch giúp ổn định nhiệt độ khi chạy đường dài hoặc tải nặng, tiêu hao nhiên liệu chỉ khoảng 2,02 lít/100km.', @base + 'dong-co-xe-so-ga.jpg', 0),
(2, 8, N'Hệ thống ACG Starter thông minh', N'Máy phát điện tích hợp bộ khởi động không chổi than, vừa sạc ắc quy vừa khởi động động cơ không gây tiếng ồn. Công nghệ này loại bỏ bánh răng khởi động truyền thống, giảm trọng lượng, tăng độ bền và giúp khởi động lại sau Idling Stop gần như tức thời.', @base + 'bo-de-acg.jpg', 1),
(3, 8, N'Cốp rộng 23,2 lít', N'Cốp dưới yên có dung tích lên đến 23,2 lít, đủ chứa một mũ bảo hiểm full-face và nhiều vật dụng khác, đáp ứng tốt nhu cầu hàng ngày. Nắp cốp được hỗ trợ bằng lò xo giảm chấn, mở nhẹ nhàng.', @base + 'cop-lon.jpg', 0),
(3, 8, N'Hệ thống khóa thông minh Smartkey', N'Smartkey Honda thế hệ mới giao tiếp không dây với fob, cho phép mở khóa, khóa cổ, mở cốp và tìm xe từ xa. Núm xoay tích hợp đèn LED báo trạng thái, có chế độ tiết kiệm pin khi không sử dụng. Nếu fob hết pin, vẫn có thể khởi động xe bằng cách áp fob vào vị trí cảm ứng.', @base + 'smartkey.jpg', 1),
(3, 8, N'Nắp bình xăng tiện lợi phía trước', N'Bình xăng được bố trí ở mặt nạ trước, chỉ cần xoay núm là mở được mà không cần rút chìa khóa hay xuống xe, tiện lợi tối đa khi đổ xăng. Nắp có gioăng kín ngăn mùi xăng và nước lọt vào.', @base + 'nap-xang-truoc.jpg', 2),
(4, 8, N'Phanh CBS đĩa trước an toàn', N'Hệ thống phanh kết hợp CBS phân phối lực phanh đến cả hai bánh khi bóp phanh trái. Phanh đĩa thủy lực trước đường kính lớn và phanh tang trống sau cho lực dừng êm, an toàn.', @base + 'phanh-dia-abs.jpg', 0),
(4, 8, N'Giảm xóc sau lò xo trụ đôi', N'Giảm xóc sau dạng lò xo trụ đôi có 5 cấp điều chỉnh tải trọng, giúp xe êm ái ngay cả khi chở hai người hoặc chở đồ nặng.', @base + 'giam-xoc-tru-doi.jpg', 1),
(4, 8, N'Lốp không săm kích thước lớn', N'Lốp trước 90/80-14, lốp sau 100/80-14 không săm, gai lốp thể thao, tăng độ bám đường khi vào cua và trên đường ướt.', @base + 'lop-khong-sam.jpg', 2);

-- SẢN PHẨM 9: Yamaha NVX
-- ============================================================
-- ============================================================
INSERT INTO Features (feature_group_id, product_id, Name, Description, image_url, display_order) VALUES
(1, 9, N'Thiết kế Maxi-Scooter thể thao', N'NVX sở hữu kiểu dáng "siêu xe tay ga" với thân hình to bản, bình xăng đặt giữa kiểu xe phân khối lớn, lốp to bản và phần đầu xe hầm hố.', @base + 'tem-xe.jpg', 0),
(1, 9, N'Đồng hồ Full LCD thể thao', N'Màn hình LCD toàn phần hiển thị tốc độ, vòng tua, mức xăng, nhiệt độ máy, hành trình. Giao diện hiện đại, dễ quan sát khi di chuyển tốc độ cao.', @base + 'dong-ho-lcd.jpg', 1),
(1, 9, N'Đèn hậu LED chữ Y đặc trưng', N'Đèn hậu LED thiết kế hình chữ Y cá tính, xi-nhan LED tách rời giúp tăng khả năng nhận diện ban đêm.', @base + 'den-hau-led.jpg', 2),
(2, 9, N'Động cơ Blue Core 155cc VVA', N'Khối động cơ 155cc, xy-lanh đơn, 4 kỳ, 4 van, SOHC, làm mát bằng chất lỏng, tích hợp công nghệ Van biến thiên VVA (Variable Valve Actuation). Hệ thống VVA sử dụng hai biên dạng cam nạp khác nhau, chuyển đổi linh hoạt dựa trên tốc độ vòng tua: ở vòng tua thấp, biên dạng cam nhẹ giúp tiết kiệm nhiên liệu, tăng mô-men; ở vòng tua cao, biên dạng cam cao mở rộng van nạp tối đa để tăng công suất. Công suất cực đại 11,3 kW tại 8.000 vòng/phút và mô-men xoắn 13,9 Nm tại 6.500 vòng/phút. Hộp số CVT tự động với dây curoa bản rộng và bộ ly hợp ly tâm cho phép tăng tốc mượt mà không giật cục. Hệ thống phun xăng điện tử Fi phản ứng nhanh, tiết kiệm nhiên liệu (khoảng 2,2 lít/100km).', @base + 'dong-co-phan-khoi-lon.jpg', 0),
(2, 9, N'Hệ thống làm mát bằng dung dịch với quạt điện tử', N'Két nước nhôm nhẹ kết hợp quạt làm mát điều khiển bằng ECU, chỉ hoạt động khi cần thiết để tiết kiệm năng lượng. Hệ thống giúp động cơ duy trì nhiệt độ lý tưởng ngay cả trong điều kiện đường đô thị đông đúc hoặc leo dốc.', @base + 'he-thong-lam-mat.jpg', 1),
(3, 9, N'Cốp rộng 25 lít', N'Cốp dưới yên có dung tích 25 lít, đủ chứa một mũ bảo hiểm full-face kèm áo mưa và đồ dùng cá nhân. Nắp cốp đóng mở nhẹ nhàng, có thể khóa bằng smartkey.', @base + 'cop-lon.jpg', 0),
(3, 9, N'Bình xăng dung tích 5,5 lít', N'Bình xăng đặt ở vị trí trung tâm (giữa hai chân người lái) giúp phân bổ trọng lượng hợp lý, tăng độ ổn định. Dung tích 5,5 lít cho phép di chuyển quãng đường dài mà không cần dừng đổ xăng thường xuyên.', @base + 'binh-xang-giua.jpg', 1),
(3, 9, N'Khóa thông minh Smartkey Yamaha', N'Hệ thống khóa từ xa Yamaha Smartkey với khả năng chống trộm vượt trội: tín hiệu rolling code mã hóa, không thể sao chép. Chức năng mở khóa, khóa cổ, tìm xe và mở cốp được thực hiện qua núm xoay tiện lợi. Khi fob hết pin, vẫn có thể khởi động khẩn cấp bằng cách áp fob vào vị trí cảm ứng.', @base + 'smartkey.jpg', 2),
(4, 9, N'Phanh đĩa trước/sau với ABS', N'Phanh đĩa thủy lực cả hai bánh, phiên bản cao có ABS chống bó cứng phanh bánh trước, giúp kiểm soát phanh hiệu quả trong tình huống khẩn cấp.', @base + 'phanh-dia-abs.jpg', 0),
(4, 9, N'Giảm xóc sau Monoshock thể thao', N'Giảm xóc sau dạng Monoshock đặt dưới gầm, kết hợp giảm xóc trước ống lồng đường kính lớn, cho khả năng vận hành ổn định và êm ái.', @base + 'giam-xoc-tru-doi.jpg', 1),
(4, 9, N'Lốp không săm bản to', N'Lốp trước 110/80-14, lốp sau 140/70-14 không săm, bản to giúp bám đường cực tốt, an toàn khi vào cua tốc độ cao.', @base + 'lop-khong-sam.jpg', 2);

-- SẢN PHẨM 10: Piaggio Liberty
-- ============================================================
-- ============================================================
INSERT INTO Features (feature_group_id, product_id, Name, Description, image_url, display_order) VALUES
(1, 10, N'Phong cách Ý thanh lịch', N'Liberty mang đậm chất châu Âu với thiết kế cổ điển pha hiện đại, mặt nạ mạ chrome thanh mảnh, yên xe bọc da cao cấp, cặp vành hợp kim 16 inch (trước) / 14 inch (sau) tạo dáng vẻ sang trọng.', @base + 'tem-xe.jpg', 0),
(1, 10, N'Đồng hồ analog kết hợp LCD', N'Bảng đồng hồ gồm đồng hồ tốc độ analog cổ điển và màn hình LCD nhỏ hiển thị mức xăng, quãng đường và đồng hồ.', @base + 'dong-ho-analog.jpg', 1),
(1, 10, N'Đèn pha LED định vị ban ngày', N'Cụm đèn pha LED với dải đèn định vị ban ngày hình chữ C, tăng vẻ sang trọng và an toàn khi di chuyển.', @base + 'den-pha-led.jpg', 2),
(2, 10, N'Động cơ iGet 125cc làm mát không khí', N'Khối động cơ iGet (Italian Green Experience Technology) 125cc, xy-lanh đơn, 3 van (2 van nạp, 1 van xả), làm mát bằng không khí cưỡng bức. Thiết kế 3 van giúp tối ưu hóa dòng khí nạp, tăng hiệu suất đốt cháy, đồng thời giảm ma sát nội bộ nhờ trục cam đơn và cò mổ nhẹ. Công suất tối đa 7,6 kW tại 7.600 vòng/phút và mô-men xoắn 10,4 Nm tại 6.000 vòng/phút. Hệ thống phun xăng điện tử Piaggio với cảm biến áp suất khí nạp và cảm biến nhiệt độ động cơ giúp điều chỉnh lượng xăng phun chính xác trong mọi điều kiện thời tiết và độ cao. Động cơ vận hành êm ái, ít rung, tiêu hao nhiên liệu khoảng 2,0 lít/100km, đáp ứng tiêu chuẩn khí thải Euro 4.', @base + 'dong-co-xe-so-ga.jpg', 0),
(3, 10, N'Cốp rộng rãi', N'Dung tích cốp dưới yên đủ chứa một mũ bảo hiểm full-face và các vật dụng cá nhân. Sàn để chân phẳng rộng rãi có thể đặt thêm túi xách, rất tiện cho đi mua sắm.', @base + 'cop-lon.jpg', 0),
(3, 10, N'Hệ thống khóa từ chống trộm Immobilizer', N'Ổ khóa tích hợp chip Immobilizer mã hóa, ngăn chặn việc khởi động xe nếu không có chìa khóa nguyên bản. Công nghệ này chống trộm hiệu quả, không thể bắt sóng hay sao chép chìa.', @base + 'chong-trom-co.jpg', 1),
(3, 10, N'Bình xăng dung tích 6 lít', N'Bình xăng lớn cho phép di chuyển quãng đường dài (khoảng 300km) mà không cần dừng đổ xăng liên tục, lý tưởng cho những chuyến đi phượt cuối tuần.', @base + 'nap-xang-truoc.jpg', 2),
(4, 10, N'Phanh đĩa trước và sau ABS', N'Phanh đĩa thủy lực đường kính 240mm cho cả bánh trước và bánh sau, kèm ABS 2 kênh, đảm bảo an toàn tối đa khi phanh gấp.', @base + 'phanh-dia-abs.jpg', 0),
(4, 10, N'Hệ thống treo êm ái', N'Giảm xóc trước dạng ống lồng thủy lực, giảm xóc sau lò xo trụ đơn với 5 cấp điều chỉnh tải trọng.', @base + 'giam-xoc-tru-doi.jpg', 1),
(4, 10, N'Lốp không săm cỡ lớn', N'Lốp trước 100/80-16, lốp sau 110/80-14 không săm, giúp bám đường và hấp thụ chấn động tốt hơn.', @base + 'lop-khong-sam.jpg', 2);

-- SẢN PHẨM 11: Vespa Sprint
-- ============================================================
-- ============================================================
INSERT INTO Features (feature_group_id, product_id, Name, Description, image_url, display_order) VALUES
(1, 11, N'Thiết kế cổ điển biểu tượng', N'Vespa Sprint giữ nguyên triết lý thiết kế thép liền khối monocoque, thân xe tròn trịa thanh lịch, yên xe bọc da sang trọng, tay lái mạ chrome.', @base + 'tem-xe.jpg', 0),
(1, 11, N'Đồng hồ analog kết hợp LCD', N'Bảng đồng hồ thiết kế tròn cổ điển với mặt số analog tốc độ lớn, tích hợp màn hình LCD nhỏ hiển thị mức xăng, quãng đường và đồng hồ.', @base + 'dong-ho-analog.jpg', 1),
(1, 11, N'Đèn hậu LED tinh tế', N'Cụm đèn hậu LED hình thang mềm mại, ôm sát đuôi xe, xi-nhan LED tách rời tăng nét sang trọng.', @base + 'den-hau-led.jpg', 2),
(2, 11, N'Động cơ iGet 125cc làm mát không khí', N'Khối động cơ iGet 124,5cc, xy-lanh đơn, 3 van, làm mát bằng không khí cưỡng bức. Công nghệ iGet tập trung vào giảm ma sát và tối ưu hóa đốt cháy thông qua buồng đốt thiết kế mới, piston nhẹ và hệ thống phun xăng điện tử Piaggio. Công suất tối đa 7,6 kW tại 7.600 vòng/phút, mô-men xoắn 10,4 Nm tại 6.000 vòng/phút. Động cơ đạt tiêu chuẩn Euro 4, vận hành êm ái, ít rung, tiêu hao nhiên liệu khoảng 2,2 lít/100km. Hệ thống làm mát cưỡng bức với quạt gió tự động điều chỉnh tốc độ giúp nhiệt độ động cơ luôn ổn định, ngay cả khi di chuyển chậm trong phố đông.', @base + 'dong-co-xe-so-ga.jpg', 0),
(2, 11, N'Hệ thống khởi động điện êm ái', N'Bộ đề điện một chiều không chổi than, khởi động nhanh không tiếng ồn, tích hợp cảm biến vị trí trục khuỷu giúp đánh lửa chính xác ngay từ vòng quay đầu tiên.', @base + 'bo-de-acg.jpg', 1),
(3, 11, N'Cốp chứa đồ rộng rãi', N'Cốp dưới yên có dung tích khá tốt, chứa được mũ bảo hiểm 3/4 và các vật dụng cá nhân, dễ dàng mở bằng nút bấm trên tay lái hoặc chìa khóa. Bên trong lót nỉ chống trầy.', @base + 'cop-lon.jpg', 0),
(3, 11, N'Hệ thống khóa từ chống trộm Immobilizer', N'Chip mã hóa trong chìa khóa giao tiếp với ECU, nếu không đúng mã, động cơ sẽ không khởi động. Công nghệ này ngăn chặn trộm xe bằng chìa khóa giả hoặc đấu dây trực tiếp.', @base + 'chong-trom-co.jpg', 1),
(3, 11, N'Bình xăng 8 lít', N'Dung tích bình xăng lên đến 8 lít, cho phép di chuyển quãng đường hơn 350 km mà không lo hết xăng giữa chừng, phù hợp những chuyến dạo phố cuối tuần.', @base + 'nap-xang-truoc.jpg', 2),
(4, 11, N'Phanh đĩa trước ABS', N'Phanh đĩa thủy lực đường kính 200mm phía trước với ABS chống bó cứng, kết hợp phanh tang trống sau, đảm bảo an toàn.', @base + 'phanh-dia-abs.jpg', 0),
(4, 11, N'Hệ thống treo linh hoạt', N'Giảm xóc trước dạng liên kết đơn (single arm) đặc trưng của Vespa, giảm xóc sau lò xo trụ đơn với 4 cấp điều chỉnh tải trọng.', @base + 'giam-xoc-tru-doi.jpg', 1),
(4, 11, N'Lốp không săm cỡ 12 inch', N'Lốp trước/sau 110/70-12 không săm, thiết kế gai lốp đặc biệt cho độ bám tốt, ổn định khi vào cua.', @base + 'lop-khong-sam.jpg', 2);

-- SẢN PHẨM 12: Honda SH Mode
-- ============================================================
-- ============================================================
INSERT INTO Features (feature_group_id, product_id, Name, Description, image_url, display_order) VALUES
(1, 12, N'Thiết kế sang trọng kiểu Ý', N'SH Mode sở hữu thân xe mềm mại, mặt nạ mạ chrome, đèn pha LED tạo hình đôi cánh, yên xe thấp bọc da cao cấp, các chi tiết viền chrome tinh tế.', @base + 'tem-xe.jpg', 0),
(1, 12, N'Đồng hồ LCD toàn phần', N'Màn hình LCD hiển thị tốc độ, mức xăng, quãng đường, đồng hồ và đèn báo Idling Stop, giao diện trực quan.', @base + 'dong-ho-lcd.jpg', 1),
(1, 12, N'Đèn hậu LED 3D độc đáo', N'Cụm đèn hậu LED tạo khối ba chiều nổi bật, xi-nhan LED tách rời, mang đến cái nhìn thời trang và an toàn.', @base + 'den-hau-led.jpg', 2),
(2, 12, N'Động cơ eSP+ 125cc làm mát dung dịch', N'Khối động cơ 124,9cc, xy-lanh đơn, 4 kỳ, làm mát bằng chất lỏng, áp dụng công nghệ eSP+ với xi-lanh offset, piston phủ carbon và hệ thống phun xăng PGM-FI. Công suất tối đa 8,2 kW tại 8.500 vòng/phút, mô-men xoắn 11,3 Nm tại 5.000 vòng/phút. Hệ thống Idling Stop và ACG Starter giúp tiết kiệm nhiên liệu (khoảng 1,99 lít/100km) và khởi động lại êm ái không tiếng ồn. Làm mát bằng dung dịch với két nước nhôm và quạt điện tử đảm bảo động cơ luôn ở nhiệt độ tối ưu, kéo dài tuổi thọ.', @base + 'dong-co-xe-so-ga.jpg', 0),
(3, 12, N'Cốp rộng 18,5 lít', N'Cốp dưới yên có dung tích 18,5 lít, đủ chứa một mũ bảo hiểm 3/4 và nhiều đồ dùng cá nhân. Nắp cốp mở bằng nút bấm hoặc smartkey, có đèn LED chiếu sáng bên trong.', @base + 'cop-nho.jpg', 0),
(3, 12, N'Hệ thống khóa thông minh Smartkey', N'Smartkey Honda với khả năng chống trộm nâng cao, tự động nhận diện fob trong phạm vi 1,5m. Núm xoay cho phép mở khóa, khóa cổ, mở cốp và tìm xe. Có chế độ tiết kiệm pin và cảnh báo khi fob sắp hết pin.', @base + 'smartkey.jpg', 1),
(3, 12, N'Nắp bình xăng tiện lợi phía trước', N'Vị trí đổ xăng đặt ở mặt nạ trước, mở nắp dễ dàng không cần xuống xe, rất phù hợp với phụ nữ. Nắp có bản lề lò xo và gioăng kín ngăn mùi xăng.', @base + 'nap-xang-truoc.jpg', 2),
(4, 12, N'Phanh CBS đĩa trước an toàn', N'Hệ thống phanh kết hợp CBS phân bổ lực phanh đến cả hai bánh khi sử dụng phanh tay trái. Phanh đĩa thủy lực trước đường kính lớn và phanh tang trống sau đảm bảo an toàn.', @base + 'phanh-dia-abs.jpg', 0),
(4, 12, N'Giảm xóc sau lò xo trụ đôi điều chỉnh', N'Giảm xóc sau có 3 cấp điều chỉnh tải trọng, giúp xe êm ái khi chở thêm người hoặc đồ nặng, phù hợp sử dụng gia đình.', @base + 'giam-xoc-tru-doi.jpg', 1),
(4, 12, N'Lốp không săm 16 inch (trước) và 14 inch (sau)', N'Lốp trước 100/80-16, lốp sau 120/80-14 không săm, bánh lớn giúp hấp thụ xóc tốt hơn trên đường gồ ghề.', @base + 'lop-khong-sam.jpg', 2);

-- SẢN PHẨM 13: Honda SH160
-- ============================================================
-- ============================================================
INSERT INTO Features (feature_group_id, product_id, Name, Description, image_url, display_order) VALUES
(1, 13, N'Thiết kế bề thế, sang trọng', N'SH160 mang dáng vẻ cao cấp của dòng SH huyền thoại với thân xe lớn, mặt nạ mạ chrome nổi bật, đèn pha LED sắc sảo và yên xe rộng rãi.', @base + 'tem-xe.jpg', 0),
(1, 13, N'Đồng hồ LCD hiển thị đa thông tin', N'Màn hình LCD toàn phần hiển thị tốc độ, mức xăng, nhiệt độ máy, hành trình, đồng hồ và đèn báo các chức năng.', @base + 'dong-ho-lcd.jpg', 1),
(1, 13, N'Đèn hậu LED 3D tinh xảo', N'Cụm đèn hậu LED tạo khối ba chiều, xi-nhan LED tách biệt sắc nét, tăng tính thẩm mỹ và an toàn.', @base + 'den-hau-led.jpg', 2),
(2, 13, N'Động cơ eSP+ 160cc làm mát dung dịch', N'Khối động cơ 156,9cc, xy-lanh đơn, 4 kỳ, 4 van, làm mát bằng chất lỏng, ứng dụng công nghệ eSP+ mới nhất. Động cơ được trang bị cảm biến vị trí trục khuỷu và cảm biến nhiệt độ dung dịch làm mát để ECU điều chỉnh phun xăng và đánh lửa chính xác theo từng chu kỳ. Công suất tối đa 11,8 kW tại 8.500 vòng/phút và mô-men xoắn 14,7 Nm tại 5.000 vòng/phút, mạnh mẽ vượt trội so với các dòng SH trước đây. Hệ thống kiểm soát lực kéo HSTC (Honda Selectable Torque Control) theo dõi tốc độ bánh sau, khi phát hiện trượt quay sẽ tự động giảm mô-men xoắn động cơ để lấy lại độ bám, đặc biệt hữu ích trên đường ướt hoặc cát sỏi. Tiêu hao nhiên liệu khoảng 2,2 lít/100km.', @base + 'dong-co-xe-so-ga.jpg', 0),
(2, 13, N'Công nghệ kiểm soát lực kéo HSTC', N'HSTC là công nghệ lần đầu tiên xuất hiện trên xe tay ga Honda, hoạt động thông qua cảm biến tốc độ bánh trước và sau. Khi chênh lệch tốc độ vượt ngưỡng, ECU sẽ tạm thời giảm góc đánh lửa hoặc giảm lượng xăng phun để giảm mô-men xoắn, giúp bánh sau lấy lại độ bám, tăng cường an toàn chủ động.', @base + 'cong-nghe-dac-biet.jpg', 1),
(3, 13, N'Cốp rộng 28 lít', N'Dung tích cốp dưới yên lên đến 28 lít, đủ chứa một mũ bảo hiểm full-face kèm áo mưa và nhiều vật dụng. Cốp có đèn LED chiếu sáng, nắp đóng mở bằng smartkey.', @base + 'cop-lon.jpg', 0),
(3, 13, N'Hệ thống khóa thông minh Smartkey', N'Smartkey Honda thế hệ mới nhất, có khả năng giao tiếp hai chiều với fob. Ngoài các chức năng cơ bản, còn có chế độ báo động nếu có người cố gắng phá khóa. Núm xoay thiết kế mới với đèn LED báo trạng thái.', @base + 'smartkey.jpg', 1),
(3, 13, N'Kết nối Bluetooth và cổng sạc USB', N'Xe được trang bị kết nối Bluetooth với điện thoại thông minh qua ứng dụng Honda RoadSync, hiển thị cuộc gọi, tin nhắn, điều hướng trên đồng hồ. Cổng sạc USB 12W trong hộc đồ phía trước cho phép sạc nhanh điện thoại.', @base + 'ket-noi-bluetooth.jpg', 2),
(4, 13, N'Phanh đĩa ABS 2 kênh', N'Phanh đĩa thủy lực cả trước và sau, kèm hệ thống chống bó cứng phanh ABS 2 kênh, đảm bảo an toàn tối đa trong mọi tình huống phanh khẩn cấp.', @base + 'phanh-dia-abs.jpg', 0),
(4, 13, N'Giảm xóc sau lò xo trụ đôi điều chỉnh 5 cấp', N'Giảm xóc sau có 5 cấp điều chỉnh tải trọng, kết hợp giảm xóc trước ống lồng đường kính lớn, mang lại cảm giác lái êm ái và ổn định.', @base + 'giam-xoc-tru-doi.jpg', 1),
(4, 13, N'Lốp không săm bản to 16 inch (trước) và 14 inch (sau)', N'Lốp trước 110/70-16, lốp sau 130/70-14 không săm, bánh lớn giúp tăng độ ổn định và khả năng vượt chướng ngại vật.', @base + 'lop-khong-sam.jpg', 2);

-- SẢN PHẨM 14: Suzuki Viva
-- ============================================================
-- ============================================================
INSERT INTO Features (feature_group_id, product_id, Name, Description, image_url, display_order) VALUES
(1, 14, N'Thiết kế vuông vức cổ điển', N'Viva mang dáng dấp xe số truyền thống với thân xe vuông vức, mặt nạ đơn giản và tem xe tối giản. Kích thước nhỏ gọn phù hợp di chuyển trong ngõ hẻm.', @base + 'tem-xe.jpg', 0),
(1, 14, N'Đồng hồ analog trực quan', N'Bảng đồng hồ dạng cơ với mặt số tốc độ lớn, đèn báo xăng và xi-nhan rõ ràng, dễ quan sát trong mọi điều kiện ánh sáng.', @base + 'dong-ho-analog.jpg', 1),
(1, 14, N'Đèn pha halogen bền bỉ', N'Cụm đèn pha halogen truyền thống cho ánh sáng vàng ấm, chi phí thay thế thấp.', @base + 'den-pha-led.jpg', 2),
(2, 14, N'Động cơ 110cc tiết kiệm nhiên liệu', N'Khối động cơ xy-lanh đơn 113cc, 4 kỳ, làm mát bằng gió, phun xăng điện tử Fi. Công suất 6,4 kW, mô-men xoắn 8,4 Nm. Nổi tiếng với mức tiêu hao nhiên liệu cực thấp, chỉ khoảng 1,5 lít/100km, là "vua tiết kiệm xăng" trong phân khúc xe số.', @base + 'dong-co-xe-so-ga.jpg', 0),
(3, 14, N'Cốp nhỏ đựng đồ cơ bản', N'Cốp dưới yên dung tích vừa phải, chứa được áo mưa và giấy tờ, đủ cho nhu cầu đi lại hàng ngày.', @base + 'cop-nho.jpg', 0),
(3, 14, N'Móc treo đồ phía trước', N'Móc treo chắc chắn đặt ở mặt nạ, tiện lợi khi treo túi xách nhỏ hoặc đồ đi chợ.', @base + 'moc-treo.jpg', 1),
(3, 14, N'Khóa cơ đa năng', N'Ổ khóa tích hợp khóa từ chống trộm, khóa cổ và mở yên, vận hành bền bỉ.', @base + 'chong-trom-co.jpg', 2),
(4, 14, N'Phanh tang trống trước và sau', N'Phanh cơ tang trống cả hai bánh, đem lại lực phanh ổn định cho tốc độ đô thị, dễ bảo dưỡng.', @base + 'phanh-dia-abs.jpg', 0),
(4, 14, N'Giảm xóc trước ống lồng thủy lực', N'Giảm xóc trước hành trình dài giúp hấp thụ chấn động, mang lại cảm giác lái êm trên đường xấu.', @base + 'giam-xoc-tru-doi.jpg', 1),
(4, 14, N'Lốp có săm bền bỉ', N'Lốp trước 2.50-17, lốp sau 2.75-17 có săm, phổ biến, dễ vá và thay thế.', @base + 'lop-khong-sam.jpg', 2);

-- SẢN PHẨM 15: SYM Galaxy
-- ============================================================
-- ============================================================
INSERT INTO Features (feature_group_id, product_id, Name, Description, image_url, display_order) VALUES
(1, 15, N'Thiết kế thể thao trẻ trung', N'Galaxy sở hữu ngoại hình sắc nét với đầu xe vuốt nhọn, thân xe dập nổi khỏe khoắn và tem xe màu sắc nổi bật.', @base + 'tem-xe.jpg', 0),
(1, 15, N'Đồng hồ kỹ thuật số hiện đại', N'Màn hình LCD hiển thị tốc độ, mức xăng và hành trình, thiết kế gọn gàng, dễ đọc.', @base + 'dong-ho-lcd.jpg', 1),
(1, 15, N'Cụm đèn hậu LED sắc nét', N'Đèn hậu LED thiết kế góc cạnh, xi-nhan tách rời, tăng tính thể thao và an toàn.', @base + 'den-hau-led.jpg', 2),
(2, 15, N'Động cơ 110cc mạnh mẽ', N'Khối động cơ 110cc, xy-lanh đơn, 4 kỳ, làm mát bằng gió, phun xăng điện tử Fi. Công suất 6,5 kW, mô-men xoắn 8,5 Nm, vận hành bốc, tiết kiệm nhiên liệu.', @base + 'dong-co-xe-so-ga.jpg', 0),
(3, 15, N'Cốp dung tích 10 lít', N'Cốp dưới yên đủ chứa mũ bảo hiểm nửa đầu và vật dụng nhỏ, tiện lợi cho học sinh.', @base + 'cop-nho.jpg', 0),
(3, 15, N'Móc treo đồ chịu lực', N'Móc treo trước có thể treo túi nặng tới 3kg, giúp mang theo cặp sách hoặc đồ mua sắm.', @base + 'moc-treo.jpg', 1),
(3, 15, N'Ổ khóa tích hợp mở cốp', N'Khóa cơ bền bỉ, mở cốp ngay trên ổ khóa, thao tác đơn giản.', @base + 'chong-trom-co.jpg', 2),
(4, 15, N'Phanh đĩa trước thủy lực', N'Phanh đĩa đường kính 220mm phía trước cho lực phanh tốt, kết hợp phanh tang trống sau an toàn.', @base + 'phanh-dia-abs.jpg', 0),
(4, 15, N'Giảm xóc sau lò xo trụ đôi', N'Giảm xóc sau với lò xo trụ đôi, khả năng chịu tải tốt, ổn định khi chở thêm người.', @base + 'giam-xoc-tru-doi.jpg', 1),
(4, 15, N'Lốp không săm thể thao', N'Lốp trước 70/90-17, sau 80/90-17 không săm, hạn chế nổ lốp đột ngột.', @base + 'lop-khong-sam.jpg', 2);

-- SẢN PHẨM 16: Kawasaki Z1000
-- ============================================================
-- ============================================================
INSERT INTO Features (feature_group_id, product_id, Name, Description, image_url, display_order) VALUES
(1, 16, N'Thiết kế Sugomi dữ dằn', N'Z1000 mang phong cách Sugomi với thân hình cơ bắp, đèn pha LED đôi như cặp mắt săn mồi, bình xăng hầm hố và ống xả kép vểnh cao.', @base + 'tem-xe.jpg', 0),
(1, 16, N'Đồng hồ LCD kết hợp analog', N'Bảng đồng hồ gồm vòng tua analog thể thao và màn hình LCD đa thông tin: tốc độ, mức xăng, nhiệt độ máy, hành trình, chỉ số ECO.', @base + 'dong-ho-analog.jpg', 1),
(1, 16, N'Cụm đèn hậu LED chữ Z', N'Đèn hậu LED tạo hình chữ Z sắc lạnh, xi-nhan LED gọn gàng, tăng nhận diện thương hiệu.', @base + 'den-hau-led.jpg', 2),
(2, 16, N'Động cơ 1043cc DOHC 4 xy-lanh thẳng hàng', N'Khối động cơ 4 xy-lanh thẳng hàng, dung tích 1.043cc, làm mát bằng chất lỏng, 16 van DOHC, sản sinh công suất tối đa 142 mã lực tại 10.000 vòng/phút và mô-men xoắn 111 Nm tại 7.300 vòng/phút. Hệ thống phun xăng điện tử Keihin với bướm ga kép đường kính 38mm cho phản ứng ga tức thì, mượt mà. Âm thanh ống xả gầm gừ đầy phấn khích, tăng tốc cực mạnh.', @base + 'dong-co-phan-khoi-lon.jpg', 0),
(2, 16, N'Hệ thống bướm ga kép Keihin', N'Bướm ga kép đường kính 38mm với bướm phụ điều khiển bằng ECU, giúp tối ưu hóa dòng khí nạp ở mọi dải vòng tua, tăng mô-men xoắn ở vòng tua thấp và công suất đỉnh ở vòng tua cao.', @base + 'cong-nghe-dac-biet.jpg', 1),
(3, 16, N'Màn hình hiển thị thông tin đầy đủ', N'Bảng đồng hồ hiển thị đồng hồ, trip, mức tiêu hao nhiên liệu tức thời và trung bình, đèn báo sang số, hỗ trợ người lái kiểm soát xe.', @base + 'dong-ho-lcd.jpg', 0),
(3, 16, N'Hệ thống đèn LED chiếu sáng toàn bộ', N'Đèn pha, đèn định vị và đèn hậu đều sử dụng công nghệ LED, tiết kiệm năng lượng và tăng độ sáng.', @base + 'den-pha-led.jpg', 1),
(3, 16, N'Bình xăng 17 lít', N'Dung tích bình xăng lớn cho phép di chuyển đường trường mà không phải dừng đổ xăng nhiều lần.', @base + 'binh-xang-giua.jpg', 2),
(4, 16, N'Phanh đĩa kép phía trước ABS', N'Phanh đĩa đôi đường kính 310mm phía trước với kẹp phanh 4 piston và phanh đĩa đơn 250mm phía sau, tích hợp ABS 2 kênh, đảm bảo an toàn tuyệt đối.', @base + 'phanh-dia-abs.jpg', 0),
(4, 16, N'Giảm xóc USD trước và Monoshock sau', N'Giảm xóc trước hành trình ngược (USD) 41mm có thể điều chỉnh, giảm xóc sau Monoshock nằm ngang, mang lại sự ổn định và linh hoạt khi ôm cua.', @base + 'giam-xoc-tru-doi.jpg', 1),
(4, 16, N'Lốp thể thao cỡ lớn', N'Lốp trước 120/70ZR17, lốp sau 190/50ZR17 không săm, gai lốp thiết kế cho độ bám tối đa trên đường khô và ướt.', @base + 'lop-khong-sam.jpg', 2);

-- SẢN PHẨM 17: Yamaha R15
-- ============================================================
-- ============================================================
INSERT INTO Features (feature_group_id, product_id, Name, Description, image_url, display_order) VALUES
(1, 17, N'Thiết kế sportbike từ R1', N'R15 thừa hưởng DNA thiết kế từ YZF-R1 với mặt nạ đôi mắt sắc lạnh, bình xăng cơ bắp, yên xe tách rời và đuôi vuốt cao.', @base + 'tem-xe.jpg', 0),
(1, 17, N'Đồng hồ Full LCD thể thao', N'Màn hình LCD toàn phần hiển thị vòng tua, tốc độ, mức xăng, trip, đồng hồ và đèn báo VVA.', @base + 'dong-ho-lcd.jpg', 1),
(1, 17, N'Đèn pha LED với DRL', N'Cặp đèn pha LED đôi sắc nét đi kèm dải đèn định vị ban ngày (DRL) LED, tăng vẻ hầm hố và an toàn.', @base + 'den-pha-led.jpg', 2),
(2, 17, N'Động cơ 155cc VVA làm mát dung dịch', N'Khối động cơ 155,1cc, xy-lanh đơn, 4 van, SOHC, công nghệ Van biến thiên VVA, làm mát bằng chất lỏng. Công suất tối đa 14,2 kW tại 10.000 vòng/phút, mô-men xoắn 14,1 Nm tại 8.500 vòng/phút, hộp số 6 cấp, ly hợp chống trượt Assist & Slipper, cho cảm giác sang số mượt mà và an toàn khi giảm tốc.', @base + 'dong-co-phan-khoi-lon.jpg', 0),
(2, 17, N'Hệ thống phun xăng điện tử Fi', N'Công nghệ phun xăng điện tử tối ưu hóa đốt cháy, giúp xe tiết kiệm nhiên liệu và đáp ứng tiêu chuẩn khí thải Euro 3.', @base + 'cong-nghe-dac-biet.jpg', 1),
(3, 17, N'Cốp nhỏ gọn', N'Yên sau có thể tháo rời để lộ cốp nhỏ, đủ chứa giấy tờ và dụng cụ sửa chữa cơ bản, phù hợp xe thể thao.', @base + 'cop-nho.jpg', 0),
(3, 17, N'Cụm công tắc tay lái tiện lợi', N'Tích hợp nút đèn passing, đèn hazard, đề điện và còi dễ thao tác.', @base + 'cong-tac-tay-lai.jpg', 1),
(3, 17, N'Bình xăng 11 lít', N'Dung tích bình xăng lớn cho phép di chuyển quãng đường dài, phù hợp đi phượt hoặc đua trường.', @base + 'binh-xang-giua.jpg', 2),
(4, 17, N'Phanh đĩa trước/sau với ABS', N'Phanh đĩa thủy lực đường kính 282mm trước, 220mm sau, kèm ABS 2 kênh, giúp kiểm soát phanh an toàn trên mọi mặt đường.', @base + 'phanh-dia-abs.jpg', 0),
(4, 17, N'Giảm xóc USD phía trước', N'Giảm xóc trước dạng Upside Down 37mm cho độ cứng vững và phản hồi chính xác, giảm xóc sau Monoshock liên kết, tăng độ ổn định khi vào cua.', @base + 'giam-xoc-tru-doi.jpg', 1),
(4, 17, N'Lốp thể thao không săm', N'Lốp trước 100/80-17, lốp sau 140/70-17 không săm, gai lốp radial cho độ bám cao.', @base + 'lop-khong-sam.jpg', 2);

-- SẢN PHẨM 18: Honda CBR150R
-- ============================================================
-- ============================================================
INSERT INTO Features (feature_group_id, product_id, Name, Description, image_url, display_order) VALUES
(1, 18, N'Thiết kế sportbike sắc sảo', N'CBR150R sở hữu kiểu dáng thể thao với mặt nạ đèn pha LED đôi góc cạnh, bình xăng to bản, yên xe tách rời và đuôi vuốt cao.', @base + 'tem-xe.jpg', 0),
(1, 18, N'Đồng hồ LCD toàn phần', N'Màn hình LCD hiển thị tốc độ, vòng tua, mức xăng, trip, đồng hồ và đèn báo sang số, giao diện thể thao sắc nét.', @base + 'dong-ho-lcd.jpg', 1),
(1, 18, N'Đèn hậu LED kiểu mới', N'Cụm đèn hậu LED thiết kế thanh mảnh, xi-nhan LED tách rời, tăng khả năng nhận diện ban đêm.', @base + 'den-hau-led.jpg', 2),
(2, 18, N'Động cơ DOHC 150cc làm mát dung dịch', N'Khối động cơ 149cc, xy-lanh đơn, 4 kỳ, DOHC, 4 van, làm mát bằng chất lỏng. Công suất tối đa 12,6 kW tại 9.000 vòng/phút, mô-men xoắn 13,7 Nm tại 7.000 vòng/phút, hộp số 6 cấp, ly hợp ướt đa đĩa, cho khả năng tăng tốc mạnh mẽ. Hệ thống phun xăng PGM-FI giúp tối ưu nhiên liệu.', @base + 'dong-co-phan-khoi-lon.jpg', 0),
(2, 18, N'Công nghệ PGM-FI', N'Hệ thống phun xăng điện tử PGM-FI của Honda đảm bảo hiệu suất đốt cháy tối ưu, tiết kiệm nhiên liệu và giảm phát thải.', @base + 'cong-nghe-dac-biet.jpg', 1),
(3, 18, N'Cốp nhỏ dưới yên', N'Yên sau có thể mở để lộ cốp nhỏ chứa đồ, phù hợp với thiết kế sportbike.', @base + 'cop-nho.jpg', 0),
(3, 18, N'Nút đèn Hazard và Passing', N'Cụm công tắc tay lái tiện lợi với đầy đủ chức năng đèn cảnh báo, passing, đề điện.', @base + 'cong-tac-tay-lai.jpg', 1),
(3, 18, N'Bình xăng 12 lít', N'Dung tích bình xăng lớn giúp di chuyển đường trường mà không cần dừng nhiều lần.', @base + 'binh-xang-giua.jpg', 2),
(4, 18, N'Phanh đĩa trước/sau với ABS', N'Phanh đĩa thủy lực cả hai bánh (trước 296mm, sau 220mm), phiên bản cao cấp có ABS, tăng cường an toàn khi phanh gấp.', @base + 'phanh-dia-abs.jpg', 0),
(4, 18, N'Giảm xóc trước ống lồng và Monoshock sau', N'Giảm xóc trước ống lồng đường kính 37mm, giảm xóc sau Monoshock Pro-Link 5 cấp điều chỉnh, mang lại sự ổn định và linh hoạt.', @base + 'giam-xoc-tru-doi.jpg', 1),
(4, 18, N'Lốp thể thao không săm', N'Lốp trước 100/80-17, lốp sau 130/70-17 không săm, gai lốp thể thao bám đường tốt.', @base + 'lop-khong-sam.jpg', 2);

-- SẢN PHẨM 19: Suzuki Raider
-- ============================================================
-- ============================================================
INSERT INTO Features (feature_group_id, product_id, Name, Description, image_url, display_order) VALUES
(1, 19, N'Thiết kế Hyper-Underbone độc đáo', N'Suzuki Raider mang kiểu dáng underbone thể thao, đầu xe hầm hố với đèn pha LED đôi, thân xe nhiều đường cắt xẻ cơ bắp và tem xe nổi bật.', @base + 'tem-xe.jpg', 0),
(1, 19, N'Đồng hồ kỹ thuật số thể thao', N'Màn hình LCD hiển thị tốc độ, vòng tua, mức xăng, hành trình, đồng hồ. Đèn nền xanh dương tạo cảm giác thể thao.', @base + 'dong-ho-lcd.jpg', 1),
(1, 19, N'Đèn hậu LED sắc lạnh', N'Cụm đèn hậu LED hình chữ X đặc trưng, xi-nhan LED gọn gàng, tăng tính nhận diện.', @base + 'den-hau-led.jpg', 2),
(2, 19, N'Động cơ DOHC 150cc làm mát dung dịch', N'Khối động cơ 147,3cc, xy-lanh đơn, 4 kỳ, DOHC, 4 van, làm mát bằng chất lỏng. Công suất tối đa 13,6 kW tại 10.500 vòng/phút, mô-men xoắn 12,5 Nm tại 8.500 vòng/phút, hộp số 6 cấp, cho khả năng bứt tốc nhanh nhất phân khúc. Hệ thống phun xăng điện tử Suzuki giúp đốt cháy hoàn hảo.', @base + 'dong-co-phan-khoi-lon.jpg', 0),
(2, 19, N'Hệ thống phun xăng điện tử Fi', N'Công nghệ phun xăng điện tử Suzuki giúp đốt cháy hoàn hảo, cho phản ứng ga tức thì và tiết kiệm nhiên liệu.', @base + 'cong-nghe-dac-biet.jpg', 1),
(3, 19, N'Cốp nhỏ dưới yên', N'Cốp dưới yên vừa đủ chứa áo mưa, giấy tờ, phù hợp với phong cách thể thao.', @base + 'cop-nho.jpg', 0),
(3, 19, N'Công tắc điều khiển đầy đủ', N'Tay lái thể thao tích hợp nút đèn passing, hazard, đề và còi.', @base + 'cong-tac-tay-lai.jpg', 1),
(3, 19, N'Chân chống bên an toàn', N'Chân chống bên có công tắc ngắt động cơ, không thể nổ máy nếu chân chống chưa gạt lên.', @base + 'chan-chong-an-toan.jpg', 2),
(4, 19, N'Phanh đĩa trước/sau với ABS', N'Phanh đĩa thủy lực cả hai bánh, phiên bản ABS cho khả năng phanh an toàn vượt trội.', @base + 'phanh-dia-abs.jpg', 0),
(4, 19, N'Giảm xóc Monoshock sau', N'Giảm xóc sau dạng Monoshock thể thao, giảm xóc trước ống lồng đường kính lớn, đảm bảo ổn định khi ôm cua.', @base + 'giam-xoc-tru-doi.jpg', 1),
(4, 19, N'Lốp thể thao không săm', N'Lốp trước 90/80-17, lốp sau 120/70-17 không săm, gai lốp thiết kế cho độ bám cao.', @base + 'lop-khong-sam.jpg', 2);

-- SẢN PHẨM 20: Honda Future
-- ============================================================
-- ============================================================
INSERT INTO Features (feature_group_id, product_id, Name, Description, image_url, display_order) VALUES
(1, 20, N'Thiết kế sang trọng như xe ga', N'Future mang vẻ ngoài cao cấp với mặt nạ mạ chrome to bản, đèn pha phản xạ đa giác, thân xe lớn và tem xe tinh tế.', @base + 'tem-xe.jpg', 0),
(1, 20, N'Đồng hồ analog kết hợp LCD', N'Bảng đồng hồ gồm mặt số tốc độ analog cổ điển và màn hình LCD nhỏ hiển thị mức xăng, quãng đường, đồng hồ.', @base + 'dong-ho-analog.jpg', 1),
(1, 20, N'Đèn hậu LED hiện đại', N'Cụm đèn hậu LED và xi-nhan tách rời, tăng vẻ sang trọng và an toàn.', @base + 'den-hau-led.jpg', 2),
(2, 20, N'Động cơ 125cc Fi làm mát bằng gió', N'Khối động cơ 124,8cc, xy-lanh đơn, 4 kỳ, làm mát bằng gió, phun xăng điện tử PGM-FI. Công suất tối đa 6,7 kW tại 7.500 vòng/phút, mô-men xoắn 9,6 Nm tại 5.500 vòng/phút. Vận hành êm ái, tiết kiệm nhiên liệu (khoảng 1,6 lít/100km), đáp ứng tiêu chuẩn khí thải Euro 3.', @base + 'dong-co-xe-so-ga.jpg', 0),
(3, 20, N'Cốp rộng rãi nhất phân khúc', N'Dung tích cốp lên đến 18,5 lít, chứa được mũ bảo hiểm 3/4 và nhiều đồ dùng, tiện lợi không kém xe tay ga.', @base + 'cop-lon.jpg', 0),
(3, 20, N'Ổ khóa đa năng chống trộm', N'Khóa cơ tích hợp khóa từ, khóa cổ và mở cốp, vận hành bền bỉ, an toàn.', @base + 'chong-trom-co.jpg', 1),
(3, 20, N'Móc treo đồ tiện lợi', N'Móc treo phía trước chịu lực tốt, giúp treo túi đồ đi chợ.', @base + 'moc-treo.jpg', 2),
(4, 20, N'Phanh đĩa trước thủy lực', N'Phanh đĩa đường kính 240mm phía trước cho lực phanh mạnh, kết hợp phanh tang trống sau an toàn.', @base + 'phanh-dia-abs.jpg', 0),
(4, 20, N'Giảm xóc sau lò xo trụ đôi', N'Giảm xóc sau 3 cấp điều chỉnh tải trọng, giúp xe êm ái khi chở nặng.', @base + 'giam-xoc-tru-doi.jpg', 1),
(4, 20, N'Lốp không săm bền bỉ', N'Lốp trước 70/90-17, lốp sau 80/90-17 không săm, tăng độ an toàn khi di chuyển.', @base + 'lop-khong-sam.jpg', 2);

-- SẢN PHẨM 21: Yamaha Jupiter
-- ============================================================
-- ============================================================
INSERT INTO Features (feature_group_id, product_id, Name, Description, image_url, display_order) VALUES
(1, 21, N'Thiết kế thể thao mạnh mẽ', N'Jupiter có ngoại hình cơ bắp với đầu xe đèn đôi sắc sảo, thân xe cắt xẻ mạnh mẽ và tem xe năng động, thừa hưởng DNA từ Exciter.', @base + 'tem-xe.jpg', 0),
(1, 21, N'Đồng hồ LCD toàn phần', N'Màn hình LCD hiển thị tốc độ, mức xăng, hành trình, đồng hồ và đèn báo, thiết kế gọn gàng.', @base + 'dong-ho-lcd.jpg', 1),
(1, 21, N'Đèn hậu LED hình chữ Y', N'Cụm đèn hậu LED đặc trưng của Yamaha, xi-nhan LED tách rời, tăng tính thể thao.', @base + 'den-hau-led.jpg', 2),
(2, 21, N'Động cơ 115cc Blue Core làm mát bằng gió', N'Khối động cơ xy-lanh đơn 114cc, 4 kỳ, làm mát bằng không khí cưỡng bức, áp dụng công nghệ Blue Core toàn diện: xi-lanh DiASil nhẹ, piston phủ lớp chống mài mòn, trục khuỷu cân bằng, hệ thống phun xăng điện tử Fi với cảm biến ô-xy. Công suất 6,6 kW tại 7.500 vòng/phút, mô-men xoắn 9,2 Nm tại 5.500 vòng/phút. Hệ thống làm mát bằng quạt gió điều khiển nhiệt, giúp động cơ luôn mát ngay cả khi chạy chậm trong phố, tiêu hao nhiên liệu chỉ 1,64 lít/100km, vận hành êm ái và bền bỉ.', @base + 'dong-co-xe-so-ga.jpg', 0),
(3, 21, N'Cốp rộng nhất phân khúc xe số', N'Dung tích cốp lên đến 15 lít, đủ chứa mũ bảo hiểm nửa đầu và áo mưa, nắp cốp mở bằng nút bấm tích hợp trong ổ khóa.', @base + 'cop-lon.jpg', 0),
(3, 21, N'Móc treo đồ chắc chắn', N'Móc treo phía trước làm bằng thép không gỉ, chịu tải 4kg, thiết kế chống tuột, tiện lợi khi đi chợ.', @base + 'moc-treo.jpg', 1),
(3, 21, N'Ổ khóa đa năng', N'Khóa cơ 3 trong 1 (điện, cổ, cốp), chìa khóa có rãnh chống sao chép, ổ khóa chống nước đạt chuẩn IP54.', @base + 'chong-trom-co.jpg', 2),
(4, 21, N'Phanh đĩa trước thủy lực', N'Phanh đĩa trước đường kính 220mm cho lực phanh tốt, phanh tang trống sau đảm bảo an toàn.', @base + 'phanh-dia-abs.jpg', 0),
(4, 21, N'Giảm xóc sau lò xo trụ đôi điều chỉnh', N'Giảm xóc sau có 3 cấp điều chỉnh tải trọng, giúp xe ổn định khi chở thêm người.', @base + 'giam-xoc-tru-doi.jpg', 1),
(4, 21, N'Lốp không săm', N'Lốp trước 70/90-17, sau 80/90-17 không săm, hạn chế rủi ro thủng lốp.', @base + 'lop-khong-sam.jpg', 2);

-- SẢN PHẨM 22: SYM Attila
-- ============================================================
-- ============================================================
INSERT INTO Features (feature_group_id, product_id, Name, Description, image_url, display_order) VALUES
(1, 22, N'Phong cách vintage nhẹ nhàng', N'Attila mang vẻ đẹp cổ điển châu Âu với thân xe tròn trịa, đèn pha tròn dễ thương, yên xe thấp và sàn để chân phẳng rộng rãi.', @base + 'tem-xe.jpg', 0),
(1, 22, N'Đồng hồ analog đơn giản', N'Bảng đồng hồ dạng cơ hiển thị tốc độ và đèn báo xăng, thiết kế dễ thương, phù hợp phong cách vintage.', @base + 'dong-ho-analog.jpg', 1),
(1, 22, N'Đèn hậu LED tròn cổ điển', N'Cụm đèn hậu LED tròn và xi-nhan tách rời, tăng nét hoài cổ và an toàn.', @base + 'den-hau-led.jpg', 2),
(2, 22, N'Động cơ 125cc làm mát bằng gió', N'Khối động cơ xy-lanh đơn 124,6cc, 4 kỳ, làm mát bằng không khí cưỡng bức, phun xăng điện tử Fi với bộ điều khiển ECU 16-bit. Công suất 6,8 kW tại 8.000 vòng/phút, mô-men xoắn 9,2 Nm tại 5.500 vòng/phút, cho khả năng tăng tốc mượt mà, tiết kiệm xăng (khoảng 1,8 lít/100km). Quạt làm mát tự động điều chỉnh tốc độ giúp động cơ không quá nhiệt khi chạy chậm, kéo dài tuổi thọ.', @base + 'dong-co-xe-so-ga.jpg', 0),
(3, 22, N'Cốp rộng 21 lít', N'Dung tích cốp lớn, chứa được mũ bảo hiểm 3/4 và nhiều đồ dùng, tiện lợi cho đi chợ, đi làm. Nắp cốp có đệm cao su giảm ồn.', @base + 'cop-lon.jpg', 0),
(3, 22, N'Sàn để chân phẳng rộng', N'Sàn phẳng rộng rãi có thể đặt thêm túi xách, ba lô, rất thực tế cho chị em. Bề mặt sàn phủ nhám chống trượt.', @base + 'san-chan-phang.jpg', 1),
(3, 22, N'Khóa cơ tích hợp mở cốp', N'Ổ khóa đa năng, mở cốp ngay trên ổ khóa, thao tác dễ dàng. Chìa khóa có chip từ chống trộm cơ bản.', @base + 'chong-trom-co.jpg', 2),
(4, 22, N'Phanh CBS kết hợp', N'Hệ thống phanh kết hợp CBS với phanh đĩa trước và tang trống sau, phân phối lực phanh tối ưu.', @base + 'phanh-dia-abs.jpg', 0),
(4, 22, N'Giảm xóc sau lò xo trụ đôi', N'Giảm xóc sau điều chỉnh được, êm ái khi chở thêm người.', @base + 'giam-xoc-tru-doi.jpg', 1),
(4, 22, N'Lốp không săm', N'Lốp trước 90/90-12, sau 100/90-10 không săm, an toàn khi di chuyển.', @base + 'lop-khong-sam.jpg', 2);

-- SẢN PHẨM 23: Kymco Like
-- ============================================================
-- ============================================================
INSERT INTO Features (feature_group_id, product_id, Name, Description, image_url, display_order) VALUES
(1, 23, N'Thiết kế cổ điển châu Âu', N'Like mang phong cách Vespa cổ điển với thân xe bo tròn, đèn pha tròn viền chrome, yên bọc da cao cấp và tay lái mạ chrome.', @base + 'tem-xe.jpg', 0),
(1, 23, N'Đồng hồ analog kết hợp LCD', N'Mặt đồng hồ analog tốc độ lớn, kèm màn hình LCD nhỏ hiển thị mức xăng và hành trình, phong cách cổ điển.', @base + 'dong-ho-analog.jpg', 1),
(1, 23, N'Đèn hậu LED tinh tế', N'Cụm đèn hậu LED tròn đối xứng, xi-nhan tách rời, tăng vẻ lịch lãm.', @base + 'den-hau-led.jpg', 2),
(2, 23, N'Động cơ 125cc làm mát không khí', N'Khối động cơ xy-lanh đơn 124,6cc, 4 kỳ, làm mát bằng không khí cưỡng bức, phun xăng điện tử Fi. Công suất 6,5 kW tại 7.500 vòng/phút, mô-men xoắn 8,9 Nm tại 5.500 vòng/phút. Công nghệ tối ưu hóa buồng đốt giúp đốt cháy hoàn toàn hỗn hợp, giảm khí thải và tiết kiệm nhiên liệu, vận hành êm ái phù hợp đô thị.', @base + 'dong-co-xe-so-ga.jpg', 0),
(3, 23, N'Cốp rộng rãi', N'Dung tích cốp dưới yên lớn, chứa được mũ bảo hiểm full-face, tiện lợi cho di chuyển hàng ngày. Cốp có lót nỉ chống trầy.', @base + 'cop-lon.jpg', 0),
(3, 23, N'Sàn phẳng để chân', N'Sàn để chân phẳng rộng rãi, đặt được túi xách hoặc đồ mua sắm, bề mặt nhám chống trượt.', @base + 'san-chan-phang.jpg', 1),
(3, 23, N'Khóa từ chống trộm', N'Ổ khóa tích hợp chip chống trộm Immobilizer, ngăn chặn khởi động xe bằng chìa khóa giả, an toàn cao.', @base + 'chong-trom-co.jpg', 2),
(4, 23, N'Phanh CBS đĩa trước', N'Phanh đĩa thủy lực trước kết hợp phanh tang trống sau, hệ thống CBS phân bổ lực phanh.', @base + 'phanh-dia-abs.jpg', 0),
(4, 23, N'Giảm xóc sau lò xo trụ đơn', N'Giảm xóc sau có 5 cấp điều chỉnh tải trọng, êm ái trên đường phố.', @base + 'giam-xoc-tru-doi.jpg', 1),
(4, 23, N'Lốp không săm 12 inch', N'Lốp trước 110/70-12, sau 130/70-12 không săm, bám đường tốt.', @base + 'lop-khong-sam.jpg', 2);

-- SẢN PHẨM 24: Peugeot Django
-- ============================================================
-- ============================================================
INSERT INTO Features (feature_group_id, product_id, Name, Description, image_url, display_order) VALUES
(1, 24, N'Thiết kế retro lãng mạn kiểu Pháp', N'Django mang phong cách xe tay ga Pháp những năm 1950 với thân xe bo tròn hai tông màu, đèn pha tròn lớn, yên xe liền khối bọc da và viền chrome sang trọng.', @base + 'tem-xe.jpg', 0),
(1, 24, N'Đồng hồ analog cổ điển', N'Bảng đồng hồ với mặt số tốc độ analog tròn, tích hợp màn hình LCD nhỏ hiển thị xăng và hành trình, thiết kế cổ điển.', @base + 'dong-ho-analog.jpg', 1),
(1, 24, N'Đèn pha LED tròn đặc trưng', N'Cụm đèn pha LED tròn viền chrome sáng bóng, đèn định vị LED tăng vẻ sang trọng.', @base + 'den-pha-led.jpg', 2),
(2, 24, N'Động cơ 150cc làm mát không khí', N'Khối động cơ xy-lanh đơn 150cc, 4 kỳ, làm mát bằng không khí cưỡng bức, phun xăng điện tử. Công suất 8,5 kW tại 8.000 vòng/phút, mô-men xoắn 11,2 Nm tại 6.000 vòng/phút. Động cơ được tinh chỉnh để vận hành mượt mà ở dải vòng tua thấp và trung bình, phù hợp phong cách lái thư thả, tiết kiệm nhiên liệu và giảm rung lắc nhờ trục cân bằng.', @base + 'dong-co-xe-so-ga.jpg', 0),
(3, 24, N'Cốp lớn chứa đồ', N'Dung tích cốp dưới yên đủ chứa một mũ bảo hiểm full-face và đồ dùng cá nhân, tiện dụng.', @base + 'cop-lon.jpg', 0),
(3, 24, N'Sàn phẳng rộng rãi', N'Sàn để chân phẳng có thể đặt thêm túi xách, rất hữu ích cho chị em.', @base + 'san-chan-phang.jpg', 1),
(3, 24, N'Hộc đồ phía trước có khóa', N'Hộc chứa đồ nhỏ phía trước có nắp khóa, tiện để điện thoại, ví. Tích hợp cổng sạc USB 5V/2A.', @base + 'hoc-do-nho.jpg', 2),
(4, 24, N'Phanh đĩa trước/sau với CBS', N'Phanh đĩa thủy lực cả hai bánh, kết hợp hệ thống CBS phân phối lực phanh an toàn.', @base + 'phanh-dia-abs.jpg', 0),
(4, 24, N'Giảm xóc trước và sau điều chỉnh', N'Giảm xóc trước ống lồng thủy lực, giảm xóc sau lò xo trụ đơn có thể điều chỉnh tải trọng.', @base + 'giam-xoc-tru-doi.jpg', 1),
(4, 24, N'Lốp không săm 12 inch', N'Lốp trước 120/70-12, lốp sau 120/70-12 không săm, bám đường tốt và êm ái.', @base + 'lop-khong-sam.jpg', 2);

-- SẢN PHẨM 25: Ducati Monster
-- ============================================================
-- ============================================================
INSERT INTO Features (feature_group_id, product_id, Name, Description, image_url, display_order) VALUES
(1, 25, N'Thiết kế naked-bike cơ bắp Ý', N'Monster sở hữu khung sườn mắt cáo trứ danh, bình xăng cơ bắp, đèn pha LED tròn đặc trưng và yên xe đơn giản, vẻ đẹp trần trụi mạnh mẽ.', @base + 'tem-xe.jpg', 0),
(1, 25, N'Đồng hồ TFT màu 4,3 inch', N'Màn hình TFT màu hiển thị đầy đủ thông số: tốc độ, vòng tua, chế độ lái, mức xăng, hành trình, kết nối điện thoại.', @base + 'dong-ho-tft.jpg', 1),
(1, 25, N'Đèn hậu LED thiết kế gọn', N'Cụm đèn hậu LED dạng dải, xi-nhan LED tách rời, tăng vẻ tối giản và thể thao.', @base + 'den-hau-led.jpg', 2),
(2, 25, N'Động cơ L-Twin 937cc Testastretta', N'Khối động cơ 2 xy-lanh hình chữ L (L-Twin) dung tích 937cc, làm mát bằng chất lỏng, 8 van Desmodromic. Công suất 111 mã lực tại 9.250 vòng/phút, mô-men xoắn 93 Nm tại 6.500 vòng/phút. Hệ thống bướm ga điện tử Ride-by-Wire, chế độ lái (Sport, Touring, Urban) tùy chỉnh công suất và kiểm soát lực kéo Ducati Traction Control, âm thanh ống xả trầm ấm đặc trưng.', @base + 'dong-co-phan-khoi-lon.jpg', 0),
(2, 25, N'Công nghệ Ducati Traction Control và chống bốc đầu', N'Hệ thống kiểm soát lực kéo DTC và chống bốc đầu Ducati Wheelie Control sử dụng cảm biến IMU 6 trục, can thiệp chính xác để duy trì độ bám và an toàn.', @base + 'cong-nghe-dac-biet.jpg', 1),
(3, 25, N'Kết nối Ducati Multimedia System', N'Xe có thể kết nối Bluetooth với điện thoại thông minh, hiển thị cuộc gọi, tin nhắn, nhạc trên đồng hồ TFT.', @base + 'ket-noi-bluetooth.jpg', 0),
(3, 25, N'Bình xăng 14 lít', N'Dung tích bình xăng lớn, đủ cho hành trình dài mà không cần dừng nhiều.', @base + 'binh-xang-giua.jpg', 1),
(3, 25, N'Đèn LED toàn bộ', N'Hệ thống chiếu sáng LED toàn bộ, tiết kiệm năng lượng và tăng độ sáng.', @base + 'den-pha-led.jpg', 2),
(4, 25, N'Phanh Brembo M4.32 với ABS Cornering', N'Phanh đĩa kép 320mm phía trước với kẹp Brembo 4 piston, phanh đĩa đơn 245mm sau, tích hợp ABS Cornering.', @base + 'phanh-dia-abs.jpg', 0),
(4, 25, N'Kiểm soát lực kéo và chống bốc đầu', N'Ducati Traction Control (DTC) và Ducati Wheelie Control (DWC) giúp kiểm soát độ bám và chống bốc đầu.', @base + 'cong-nghe-dac-biet.jpg', 1),
(4, 25, N'Lốp Pirelli Diablo Rosso III', N'Lốp 120/70ZR17 trước, 180/55ZR17 sau, gai lốp thể thao cho độ bám tuyệt vời.', @base + 'lop-khong-sam.jpg', 2);

-- SẢN PHẨM 26: BMW G310R
-- ============================================================
-- ============================================================
INSERT INTO Features (feature_group_id, product_id, Name, Description, image_url, display_order) VALUES
(1, 26, N'Thiết kế naked-bike Đức hiện đại', N'G310R mang ngôn ngữ thiết kế S1000R thu nhỏ với mặt nạ góc cạnh, bình xăng cơ bắp, yên xe thể thao và ống xả gọn gàng.', @base + 'tem-xe.jpg', 0),
(1, 26, N'Đồng hồ LCD toàn phần', N'Màn hình LCD hiển thị tốc độ, vòng tua, mức xăng, trip, đồng hồ và đèn báo ABS.', @base + 'dong-ho-lcd.jpg', 1),
(1, 26, N'Đèn pha LED hiện đại', N'Đèn pha LED với thiết kế góc cạnh, đèn định vị LED tăng khả năng nhận diện.', @base + 'den-pha-led.jpg', 2),
(2, 26, N'Động cơ 313cc xy-lanh đơn làm mát dung dịch', N'Khối động cơ 313cc, xy-lanh đơn, 4 kỳ, DOHC, 4 van, làm mát bằng chất lỏng. Công suất 34 mã lực tại 9.500 vòng/phút, mô-men xoắn 28 Nm tại 7.500 vòng/phút. Hệ thống phun xăng điện tử BMS-E của BMW với cảm biến áp suất khí nạp, cảm biến nhiệt độ, giúp tối ưu hóa nhiên liệu và phản ứng ga mượt mà, đáp ứng tiêu chuẩn Euro 5.', @base + 'dong-co-phan-khoi-lon.jpg', 0),
(2, 26, N'Hệ thống phun xăng điện tử BMS-E', N'Hệ thống quản lý động cơ BMS-E của BMW liên tục tính toán lượng nhiên liệu dựa trên tải trọng và điều kiện vận hành, cho phản ứng ga mượt mà và tiết kiệm nhiên liệu.', @base + 'cong-nghe-dac-biet.jpg', 1),
(3, 26, N'Bình xăng 11 lít', N'Dung tích bình xăng vừa phải, phù hợp di chuyển đô thị và các chặng ngắn.', @base + 'binh-xang-giua.jpg', 0),
(3, 26, N'Yên xe thoải mái', N'Yên xe thiết kế công thái học, độ cao 785mm phù hợp nhiều vóc dáng, thoải mái khi lái.', @base + 'yen-da.jpg', 1),
(3, 26, N'Ổ cắm sạc 12V', N'Xe trang bị ổ sạc 12V dưới yên, tiện sạc điện thoại khi di chuyển.', @base + 'cong-usb.jpg', 2),
(4, 26, N'Phanh đĩa ABS Bybre', N'Phanh đĩa đường kính 300mm trước với kẹp Bybre 4 piston, phanh đĩa 240mm sau, ABS 2 kênh tiêu chuẩn.', @base + 'phanh-dia-abs.jpg', 0),
(4, 26, N'Giảm xóc USD phía trước', N'Giảm xóc trước hành trình ngược (USD) 41mm, giảm xóc sau Monoshock có thể điều chỉnh tải trước.', @base + 'giam-xoc-tru-doi.jpg', 1),
(4, 26, N'Lốp thể thao không săm', N'Lốp trước 110/70R17, lốp sau 150/60R17 Michelin Pilot Street, bám đường tốt trong mọi thời tiết.', @base + 'lop-khong-sam.jpg', 2);

-- SẢN PHẨM 27: KTM Duke 390
-- ============================================================
-- ============================================================
INSERT INTO Features (feature_group_id, product_id, Name, Description, image_url, display_order) VALUES
(1, 27, N'Thiết kế góc cạnh, hầm hố', N'Duke 390 mang phong cách "Ready to Race" với đèn pha LED đôi sắc lạnh, bình xăng cắt xẻ, khung sườn màu cam nổi bật và đuôi vuốt cao.', @base + 'tem-xe.jpg', 0),
(1, 27, N'Đồng hồ TFT màu 5 inch', N'Màn hình TFT màu sắc nét, hiển thị tốc độ, vòng tua, chế độ lái, mức xăng, trip, kết nối điện thoại qua KTM My Ride.', @base + 'dong-ho-tft.jpg', 1),
(1, 27, N'Đèn hậu LED kiểu dáng độc đáo', N'Cụm đèn hậu LED dạng dải mỏng, xi-nhan LED gọn gàng, tăng vẻ thể thao và hiện đại.', @base + 'den-hau-led.jpg', 2),
(2, 27, N'Động cơ 373cc xy-lanh đơn DOHC', N'Khối động cơ 373,2cc, xy-lanh đơn, 4 kỳ, DOHC, 4 van, làm mát bằng chất lỏng. Công suất 44 mã lực tại 9.000 vòng/phút, mô-men xoắn 37 Nm tại 7.000 vòng/phút. Tăng tốc 0-100 km/h chỉ trong 5,5 giây. Bướm ga điện tử Ride-by-Wire cho phản ứng tức thì và chính xác, hỗ trợ chế độ lái (Street, Rain), hệ thống chống trượt Motorcycle Traction Control (MTC).', @base + 'dong-co-phan-khoi-lon.jpg', 0),
(2, 27, N'Công nghệ Ride-by-Wire và chế độ lái', N'Bướm ga điện tử Ride-by-Wire điều khiển bằng ECU, kết hợp chế độ lái Street (phản ứng nhanh) và Rain (giảm công suất, tăng kiểm soát), giúp lái an toàn trong mọi điều kiện thời tiết.', @base + 'cong-nghe-dac-biet.jpg', 1),
(3, 27, N'Hệ thống kết nối KTM My Ride', N'Kết nối Bluetooth với điện thoại, điều khiển nhạc, hiển thị cuộc gọi, dẫn đường từng chặng trên màn hình TFT.', @base + 'ket-noi-bluetooth.jpg', 0),
(3, 27, N'Đèn LED toàn bộ', N'Đèn pha, đèn hậu và xi-nhan đều dùng công nghệ LED, tiết kiệm năng lượng, độ sáng cao.', @base + 'den-pha-led.jpg', 1),
(3, 27, N'Bình xăng 13,4 lít', N'Dung tích bình xăng đủ cho các chuyến đi dài ngày.', @base + 'binh-xang-giua.jpg', 2),
(4, 27, N'Phanh đĩa ABS siêu thể thao', N'Phanh đĩa trước 320mm kẹp Bybre 4 piston, đĩa sau 230mm, ABS 2 kênh có thể tắt cho bánh sau (Supermoto ABS).', @base + 'phanh-dia-abs.jpg', 0),
(4, 27, N'Giảm xóc WP APEX USD', N'Giảm xóc trước WP APEX USD 43mm có thể điều chỉnh, giảm xóc sau WP Monoshock điều chỉnh tải trước và hồi phục.', @base + 'giam-xoc-tru-doi.jpg', 1),
(4, 27, N'Lốp Metzeler Sportec M5', N'Lốp 110/70ZR17 trước, 150/60ZR17 sau, gai lốp thể thao cho độ bám tối ưu khi ôm cua.', @base + 'lop-khong-sam.jpg', 2);

-- SẢN PHẨM 28: Yamaha MT15
-- ============================================================
-- ============================================================
INSERT INTO Features (feature_group_id, product_id, Name, Description, image_url, display_order) VALUES
(1, 28, N'Thiết kế Dark Side of Japan', N'MT15 mang phong cách naked-bike hầm hố với đầu đèn pha LED gương cầu độc đáo, bình xăng cơ bắp, khung sườn Deltabox lộ ra ngoài.', @base + 'tem-xe.jpg', 0),
(1, 28, N'Đồng hồ LCD toàn phần', N'Màn hình LCD âm bản hiển thị tốc độ, vòng tua, mức xăng, trip, đồng hồ. Giao diện tối, dễ đọc ban đêm.', @base + 'dong-ho-lcd.jpg', 1),
(1, 28, N'Đèn hậu LED mỏng thể thao', N'Đèn hậu LED dạng dải mỏng, xi-nhan LED gọn gàng, tạo nét thể thao tối giản.', @base + 'den-hau-led.jpg', 2),
(2, 28, N'Động cơ 155cc VVA làm mát dung dịch', N'Khối động cơ 155cc, xy-lanh đơn, 4 van, SOHC, công nghệ Van biến thiên VVA, làm mát bằng chất lỏng. Công suất 14,2 kW tại 10.000 vòng/phút, mô-men xoắn 13,9 Nm tại 7.500 vòng/phút. Hộp số 6 cấp, ly hợp chống trượt Assist & Slipper giúp sang số mượt và an toàn khi dồn số gấp. Hệ thống phun xăng Fi phản ứng nhanh, tiết kiệm nhiên liệu.', @base + 'dong-co-phan-khoi-lon.jpg', 0),
(2, 28, N'Ly hợp chống trượt Assist & Slipper', N'Công nghệ ly hợp chống trượt giảm lực kéo phanh động cơ khi giảm số đột ngột, ngăn bánh sau bó cứng, tăng an toàn khi vào cua gấp.', @base + 'ly-hop.jpg', 1),
(3, 28, N'Cốp nhỏ dưới yên', N'Cốp chứa được giấy tờ, dụng cụ nhỏ, phù hợp phong cách xe naked.', @base + 'cop-nho.jpg', 0),
(3, 28, N'Công tắc đèn passing và hazard', N'Cụm công tắc tiện lợi, an toàn khi di chuyển đường trường.', @base + 'cong-tac-tay-lai.jpg', 1),
(3, 28, N'Bình xăng 10 lít', N'Dung tích bình xăng vừa đủ cho nhu cầu đi phố và phượt ngắn ngày.', @base + 'binh-xang-giua.jpg', 2),
(4, 28, N'Phanh đĩa trước/sau với ABS', N'Phanh đĩa thủy lực đường kính 282mm trước, 220mm sau, ABS 2 kênh.', @base + 'phanh-dia-abs.jpg', 0),
(4, 28, N'Giảm xóc trước USD', N'Giảm xóc trước hành trình ngược 37mm, giảm xóc sau Monoshock liên kết, độ ổn định cao khi vào cua.', @base + 'giam-xoc-tru-doi.jpg', 1),
(4, 28, N'Lốp thể thao không săm', N'Lốp trước 110/70-17, sau 140/70-17 MRF Revz, bám đường tốt trên đường khô và ướt.', @base + 'lop-khong-sam.jpg', 2);

-- SẢN PHẨM 29: Honda PCX
-- ============================================================
-- ============================================================
INSERT INTO Features (feature_group_id, product_id, Name, Description, image_url, display_order) VALUES
(1, 29, N'Thiết kế cruiser đường trường', N'PCX mang dáng vẻ bề thế, thanh lịch với thân xe to bản, yên xe rộng rãi thoải mái, mặt nạ trước mạ chrome và cụm đèn pha LED sắc sảo.', @base + 'tem-xe.jpg', 0),
(1, 29, N'Đồng hồ LCD toàn phần', N'Màn hình LCD hiển thị tốc độ, mức xăng, hành trình, đồng hồ và đèn báo Idling Stop, giao diện hiện đại.', @base + 'dong-ho-lcd.jpg', 1),
(1, 29, N'Đèn hậu LED chữ X', N'Cụm đèn hậu LED hình chữ X đặc trưng, xi-nhan tách rời, tăng nhận diện thương hiệu.', @base + 'den-hau-led.jpg', 2),
(2, 29, N'Động cơ eSP+ 125cc làm mát dung dịch', N'Khối động cơ 124,9cc, xy-lanh đơn, 4 kỳ, làm mát bằng chất lỏng, công nghệ eSP+. Công suất 8,2 kW, mô-men xoắn 11,3 Nm. Tích hợp Idling Stop tự động ngắt động cơ khi dừng và ACG Starter khởi động lại êm ái. Làm mát bằng dung dịch giúp ổn định nhiệt độ, tiêu hao nhiên liệu khoảng 2,0 lít/100km.', @base + 'dong-co-xe-so-ga.jpg', 0),
(3, 29, N'Cốp rộng 28 lít', N'Cốp dưới yên chứa được một mũ bảo hiểm full-face và nhiều đồ dùng, tiện cho đi chơi xa.', @base + 'cop-lon.jpg', 0),
(3, 29, N'Hệ thống khóa thông minh Smartkey', N'Smartkey Honda cho phép mở khóa, tìm xe, mở cốp từ xa, tiện lợi và an toàn.', @base + 'smartkey.jpg', 1),
(3, 29, N'Cổng sạc USB tiện lợi', N'Cổng sạc USB đặt trong hộc đồ phía trước, sạc điện thoại khi di chuyển.', @base + 'cong-usb.jpg', 2),
(4, 29, N'Phanh CBS đĩa trước', N'Hệ thống phanh kết hợp CBS với phanh đĩa thủy lực trước, phanh tang trống sau, an toàn khi dừng.', @base + 'phanh-dia-abs.jpg', 0),
(4, 29, N'Giảm xóc sau lò xo trụ đôi', N'Giảm xóc sau có 3 cấp điều chỉnh tải trọng, êm ái khi chở hai người.', @base + 'giam-xoc-tru-doi.jpg', 1),
(4, 29, N'Lốp không săm cỡ lớn', N'Lốp trước 100/80-14, sau 120/70-14 không săm, độ bám tốt và ổn định.', @base + 'lop-khong-sam.jpg', 2);

-- SẢN PHẨM 30: Yamaha Grande
-- ============================================================
-- ============================================================
INSERT INTO Features (feature_group_id, product_id, Name, Description, image_url, display_order) VALUES
(1, 30, N'Thiết kế thanh lịch châu Âu', N'Grande sở hữu vẻ ngoài sang trọng với đường cong mềm mại, mặt nạ mạ chrome tinh tế, yên xe thấp và tem xe nhã nhặn.', @base + 'tem-xe.jpg', 0),
(1, 30, N'Đồng hồ LCD hiện đại', N'Màn hình LCD hiển thị đầy đủ thông tin: tốc độ, mức xăng, hành trình, đèn báo Stop & Start.', @base + 'dong-ho-lcd.jpg', 1),
(1, 30, N'Đèn hậu LED hình chữ Y', N'Cụm đèn hậu LED cách điệu chữ Y, xi-nhan LED tách rời, tăng tính thẩm mỹ.', @base + 'den-hau-led.jpg', 2),
(2, 30, N'Động cơ Blue Core 125cc với Stop & Start', N'Khối động cơ 125cc, xy-lanh đơn, 4 kỳ, làm mát bằng gió cưỡng bức, công nghệ Blue Core và hệ thống Stop & Start. Công suất 6,1 kW, mô-men xoắn 9,7 Nm. Khi dừng đèn đỏ, động cơ tự ngắt để tiết kiệm xăng, khởi động lại êm ái chỉ bằng thao tác vặn ga nhờ bộ đề ACG. Tiêu hao nhiên liệu chỉ 1,69 lít/100km, thân thiện môi trường.', @base + 'dong-co-xe-so-ga.jpg', 0),
(3, 30, N'Cốp rộng 27 lít', N'Dung tích cốp cực lớn, chứa được hai mũ bảo hiểm nửa đầu, đáp ứng mọi nhu cầu mua sắm.', @base + 'cop-lon.jpg', 0),
(3, 30, N'Hệ thống Stop & Start System', N'Tự động ngắt động cơ khi dừng đèn đỏ, khởi động lại êm ái chỉ bằng thao tác vặn ga, tiết kiệm xăng tối đa.', @base + 'cong-nghe-dac-biet.jpg', 1),
(3, 30, N'Khóa thông minh Smartkey', N'Smartkey Yamaha với chức năng mở khóa, tìm xe, mở cốp tiện lợi.', @base + 'smartkey.jpg', 2),
(4, 30, N'Phanh CBS kết hợp', N'Phanh đĩa trước thủy lực, phanh tang trống sau, hệ thống CBS phân phối lực phanh.', @base + 'phanh-dia-abs.jpg', 0),
(4, 30, N'Giảm xóc sau lò xo trụ đôi', N'Giảm xóc sau có 3 cấp điều chỉnh, êm ái trên nhiều địa hình.', @base + 'giam-xoc-tru-doi.jpg', 1),
(4, 30, N'Lốp không săm', N'Lốp trước 90/80-14, sau 100/80-14 không săm, bám đường và an toàn.', @base + 'lop-khong-sam.jpg', 2);

-- SẢN PHẨM 31: Suzuki Burgman
-- ============================================================
-- ============================================================
INSERT INTO Features (feature_group_id, product_id, Name, Description, image_url, display_order) VALUES
(1, 31, N'Thiết kế touring scooter bề thế', N'Burgman mang dáng dấp xe touring hạng sang với thân xe to bản, yên rộng thoải mái, kính chắn gió cao và đèn pha LED kép.', @base + 'tem-xe.jpg', 0),
(1, 31, N'Đồng hồ analog kết hợp LCD', N'Bảng đồng hồ gồm hai mặt analog (tốc độ, vòng tua) và màn hình LCD trung tâm hiển thị mức xăng, hành trình, nhiệt độ.', @base + 'dong-ho-analog.jpg', 1),
(1, 31, N'Đèn hậu LED sắc nét', N'Cụm đèn hậu LED lớn, xi-nhan tích hợp, tăng độ nhận diện và sang trọng.', @base + 'den-hau-led.jpg', 2),
(2, 31, N'Động cơ 125cc SEP làm mát không khí', N'Khối động cơ 124cc, xy-lanh đơn, 4 kỳ, công nghệ SEP (Suzuki Eco Performance), làm mát bằng không khí cưỡng bức. Công suất 6,4 kW tại 7.000 vòng/phút, mô-men xoắn 8,5 Nm tại 5.500 vòng/phút. Công nghệ SEP giảm ma sát nội bộ, tối ưu hóa buồng đốt, cho khả năng tiết kiệm nhiên liệu tốt, vận hành êm ái, ít rung.', @base + 'dong-co-xe-so-ga.jpg', 0),
(3, 31, N'Cốp siêu rộng 21,5 lít', N'Cốp chứa được một mũ bảo hiểm full-face và nhiều đồ dùng, sàn phẳng rộng có thể đặt thêm hành lý.', @base + 'cop-lon.jpg', 0),
(3, 31, N'Kính chắn gió tiêu chuẩn', N'Kính chắn gió cao giúp chắn gió, côn trùng khi đi đường dài, tăng thoải mái.', @base + 'kinh-chan-gio.jpg', 1),
(3, 31, N'Bình xăng 5,6 lít', N'Dung tích bình xăng hợp lý, đủ cho hành trình xa.', @base + 'nap-xang-truoc.jpg', 2),
(4, 31, N'Phanh CBS đĩa trước', N'Hệ thống phanh kết hợp CBS với phanh đĩa thủy lực trước, tang trống sau, an toàn và ổn định.', @base + 'phanh-dia-abs.jpg', 0),
(4, 31, N'Giảm xóc sau lò xo trụ đôi', N'Giảm xóc sau có 5 cấp điều chỉnh tải trọng, phù hợp chở nặng hoặc đi hai người.', @base + 'giam-xoc-tru-doi.jpg', 1),
(4, 31, N'Lốp không săm lớn', N'Lốp trước 90/90-12, sau 100/90-10 không săm, bám đường tốt, an toàn khi di chuyển.', @base + 'lop-khong-sam.jpg', 2);

-- SẢN PHẨM 32: Honda Blade
-- ============================================================
-- ============================================================
INSERT INTO Features (feature_group_id, product_id, Name, Description, image_url, display_order) VALUES
(1, 32, N'Thiết kế thon gọn trẻ trung', N'Blade có ngoại hình nhỏ gọn, mặt nạ sắc nét, tem xe hiện đại và yên xe thấp, hướng đến đối tượng trẻ.', @base + 'tem-xe.jpg', 0),
(1, 32, N'Đồng hồ analog truyền thống', N'Bảng đồng hồ dạng cơ hiển thị tốc độ và đèn báo xăng, đơn giản dễ sử dụng.', @base + 'dong-ho-analog.jpg', 1),
(1, 32, N'Đèn pha halogen bền bỉ', N'Cụm đèn pha truyền thống cho ánh sáng ổn định, chi phí thay thế rẻ.', @base + 'den-pha-led.jpg', 2),
(2, 32, N'Động cơ 110cc eSP làm mát bằng gió', N'Khối động cơ 109,1cc, xy-lanh đơn, 4 kỳ, làm mát bằng gió, công nghệ eSP (Enhanced Smart Power). Công suất 6,12 kW, mô-men xoắn 8,44 Nm. Tiết kiệm xăng vượt trội (1,77 lít/100km), vận hành êm, ít rung nhờ xi-lanh offset và piston nhẹ.', @base + 'dong-co-xe-so-ga.jpg', 0),
(3, 32, N'Cốp vừa phải', N'Cốp chứa được áo mưa, giấy tờ, tiện lợi cho nhu cầu cơ bản.', @base + 'cop-nho.jpg', 0),
(3, 32, N'Móc treo đồ phía trước', N'Móc treo chịu lực, giúp treo túi nhẹ khi đi chợ.', @base + 'moc-treo.jpg', 1),
(3, 32, N'Ổ khóa cơ đa năng', N'Khóa từ chống trộm và mở cốp, bền bỉ theo thời gian.', @base + 'chong-trom-co.jpg', 2),
(4, 32, N'Phanh cơ trước sau', N'Xe sử dụng phanh tang trống cả hai bánh, phù hợp tốc độ đô thị, dễ sửa chữa.', @base + 'phanh-dia-abs.jpg', 0),
(4, 32, N'Giảm xóc ống lồng trước', N'Giảm xóc trước hành trình dài, hấp thụ rung động tốt trên đường xấu.', @base + 'giam-xoc-tru-doi.jpg', 1),
(4, 32, N'Lốp có săm', N'Lốp 70/90-17 trước, 80/90-17 sau có săm, giá thành rẻ, dễ thay thế.', @base + 'lop-khong-sam.jpg', 2);

-- SẢN PHẨM 33: SYM Elegant
-- ============================================================
-- ============================================================
INSERT INTO Features (feature_group_id, product_id, Name, Description, image_url, display_order) VALUES
(1, 33, N'Thiết kế nhỏ gọn 50cc', N'Elegant có kích thước siêu nhỏ gọn, phù hợp học sinh không cần bằng lái. Tem xe bắt mắt, màu sắc tươi trẻ.', @base + 'tem-xe.jpg', 0),
(1, 33, N'Đồng hồ analog đơn giản', N'Bảng đồng hồ cơ hiển thị tốc độ tối đa, đèn báo xăng và xi-nhan.', @base + 'dong-ho-analog.jpg', 1),
(1, 33, N'Đèn pha halogen nhỏ', N'Đèn pha phù hợp kích thước xe, chiếu sáng đủ cho di chuyển nội thành.', @base + 'den-pha-led.jpg', 2),
(2, 33, N'Động cơ 50cc làm mát gió', N'Khối động cơ 49,5cc, xy-lanh đơn, 4 kỳ, làm mát bằng gió, công suất nhỏ vừa đủ cho tốc độ tối đa 50 km/h. Tiêu hao nhiên liệu cực thấp, khoảng 1,2 lít/100km, không yêu cầu bằng lái A1.', @base + 'dong-co-xe-so-ga.jpg', 0),
(3, 33, N'Cốp nhỏ dưới yên', N'Cốp đựng vừa áo mưa và sách vở nhỏ, phù hợp học sinh.', @base + 'cop-nho.jpg', 0),
(3, 33, N'Móc treo đồ tiện lợi', N'Móc treo trước giúp treo cặp sách hoặc túi đồ nhẹ.', @base + 'moc-treo.jpg', 1),
(3, 33, N'Khóa cơ đơn giản', N'Ổ khóa dễ sử dụng, mở yên bằng chìa.', @base + 'chong-trom-co.jpg', 2),
(4, 33, N'Phanh tang trống an toàn', N'Phanh cơ hai bánh đủ lực dừng cho tốc độ thấp.', @base + 'phanh-dia-abs.jpg', 0),
(4, 33, N'Giảm xóc trước ống lồng', N'Hành trình giảm xóc nhỏ nhưng đủ êm trong phố.', @base + 'giam-xoc-tru-doi.jpg', 1),
(4, 33, N'Lốp có săm cỡ nhỏ', N'Lốp 2.25-17 trước và sau, dễ thay, chi phí thấp.', @base + 'lop-khong-sam.jpg', 2);

-- SẢN PHẨM 34: VinFast Evo200
-- ============================================================
-- ============================================================
INSERT INTO Features (feature_group_id, product_id, Name, Description, image_url, display_order) VALUES
(1, 34, N'Thiết kế hiện đại, tối giản', N'Evo200 mang ngôn ngữ thiết kế xe điện tương lai với thân xe tròn trịa, mặt nạ LED liền mạch, yên xe thấp và màu sắc trẻ trung.', @base + 'tem-xe.jpg', 0),
(1, 34, N'Đồng hồ LCD kỹ thuật số', N'Màn hình LCD hiển thị tốc độ, mức pin, quãng đường còn lại, hành trình và đồng hồ.', @base + 'dong-ho-lcd.jpg', 1),
(1, 34, N'Đèn pha LED sắc nét', N'Cụm đèn pha LED cho ánh sáng trắng, tiết kiệm năng lượng, tăng tính thẩm mỹ.', @base + 'den-pha-led.jpg', 2),
(2, 34, N'Động cơ điện 1500W, pin LFP 3,5 kWh', N'Mô-tơ điện 1500W cho tốc độ tối đa 70 km/h. Pin Lithium Sắt Phosphate (LFP) dung lượng 3,5 kWh, cho quãng đường lên tới 200 km/lần sạc. Pin LFP có tuổi thọ cao, chịu được 2000 chu kỳ sạc/xả, an toàn không cháy nổ. Thời gian sạc đầy khoảng 8 giờ bằng ổ điện dân dụng 220V.', @base + 'dong-co-xe-dien.jpg', 0),
(3, 34, N'Cốp rộng 25 lít', N'Cốp dưới yên lớn, chứa được mũ bảo hiểm full-face và đồ dùng cá nhân.', @base + 'cop-lon.jpg', 0),
(3, 34, N'Sạc tại nhà tiện lợi', N'Xe sạc bằng ổ điện dân dụng 220V, có thể tháo pin sạc riêng (tùy phiên bản), tiết kiệm chi phí nhiên liệu.', @base + 'cong-nghe-dac-biet.jpg', 1),
(3, 34, N'Cổng sạc USB', N'Cổng sạc USB cho điện thoại, tiện ích khi di chuyển.', @base + 'cong-usb.jpg', 2),
(4, 34, N'Phanh CBS đĩa trước', N'Phanh đĩa thủy lực trước và phanh tang trống sau, kết hợp CBS, an toàn khi dừng.', @base + 'phanh-dia-abs.jpg', 0),
(4, 34, N'Hệ thống chống trộm và cảnh báo', N'Tích hợp cảm biến chống trộm, khóa từ thông minh, bảo vệ xe tối đa.', @base + 'chong-trom-co.jpg', 1),
(4, 34, N'Lốp không săm', N'Lốp trước 90/90-12, sau 100/90-10 không săm, vận hành êm và an toàn.', @base + 'lop-khong-sam.jpg', 2);

-- SẢN PHẨM 35: VinFast Klara
-- ============================================================
-- ============================================================
INSERT INTO Features (feature_group_id, product_id, Name, Description, image_url, display_order) VALUES
(1, 35, N'Thiết kế thanh lịch phong cách Ý', N'Klara sở hữu vẻ ngoài sang trọng với thân xe mềm mại, đèn pha LED tròn cổ điển, yên xe bọc da cao cấp và các chi tiết mạ chrome.', @base + 'tem-xe.jpg', 0),
(1, 35, N'Đồng hồ LCD toàn phần', N'Màn hình LCD hiển thị tốc độ, mức pin, quãng đường, hành trình và chế độ lái.', @base + 'dong-ho-lcd.jpg', 1),
(1, 35, N'Đèn hậu LED tinh tế', N'Cụm đèn hậu LED thiết kế liền khối, xi-nhan tách rời, tăng tính thẩm mỹ.', @base + 'den-hau-led.jpg', 2),
(2, 35, N'Động cơ điện 1200W, pin LFP 3,5 kWh', N'Mô-tơ điện 1200W, tốc độ tối đa 50 km/h. Pin LFP dung lượng 3,5 kWh cho quãng đường lên tới 120 km/lần sạc. Khả năng lội nước cao (IP67) giúp xe vận hành an toàn ngay cả khi ngập nhẹ. Thời gian sạc đầy trong 8 giờ, sạc nhanh 80% trong 4 giờ.', @base + 'dong-co-xe-dien.jpg', 0),
(3, 35, N'Cốp rộng 25 lít', N'Cốp chứa được mũ bảo hiểm full-face, tiện lợi cho đi chợ, đi làm.', @base + 'cop-lon.jpg', 0),
(3, 35, N'Kết nối thông minh VinFast E-Scooter', N'Ứng dụng quản lý xe trên điện thoại: định vị, kiểm tra pin, lịch sử hành trình, chẩn đoán lỗi.', @base + 'ket-noi-bluetooth.jpg', 1),
(3, 35, N'Sạc nhanh và sạc thường', N'Hỗ trợ sạc nhanh 80% trong 4 giờ, sạc đầy trong 8 giờ tại nhà.', @base + 'cong-nghe-dac-biet.jpg', 2),
(4, 35, N'Phanh CBS đĩa trước', N'Phanh đĩa thủy lực trước, tang trống sau, CBS phân bổ lực phanh hiệu quả.', @base + 'phanh-dia-abs.jpg', 0),
(4, 35, N'Chống trộm và định vị GPS', N'Khóa từ thông minh, cảnh báo chống trộm, định vị xe qua ứng dụng.', @base + 'chong-trom-co.jpg', 1),
(4, 35, N'Lốp không săm 12 inch', N'Lốp 90/90-12 trước, 100/90-10 sau không săm, êm ái và an toàn.', @base + 'lop-khong-sam.jpg', 2);

-- SẢN PHẨM 36: VinFast Feliz
-- ============================================================
-- ============================================================
INSERT INTO Features (feature_group_id, product_id, Name, Description, image_url, display_order) VALUES
(1, 36, N'Thiết kế trang nhã, hiện đại', N'Feliz mang vẻ ngoài thanh lịch với thân xe bo tròn, đèn pha LED sắc nét và yên xe thấp.', @base + 'tem-xe.jpg', 0),
(1, 36, N'Đồng hồ LCD âm bản', N'Màn hình LCD hiển thị thông tin pin, tốc độ, quãng đường, giao diện hiện đại.', @base + 'dong-ho-lcd.jpg', 1),
(1, 36, N'Đèn hậu LED dạng dải', N'Đèn hậu LED mỏng, tăng vẻ tinh tế và an toàn.', @base + 'den-hau-led.jpg', 2),
(2, 36, N'Động cơ điện 1200W, pin LFP 3,5 kWh', N'Mô-tơ 1200W, tốc độ tối đa 50 km/h, quãng đường lên đến 140 km/lần sạc. Pin LFP bền bỉ, an toàn, tuổi thọ cao, chịu được điều kiện thời tiết khắc nghiệt của Việt Nam. Sạc đầy trong 8 giờ.', @base + 'dong-co-xe-dien.jpg', 0),
(3, 36, N'Cốp siêu rộng 30 lít', N'Dung tích cốp lớn nhất phân khúc xe điện, chứa được nhiều đồ đạc, tiện cho đi siêu thị.', @base + 'cop-lon.jpg', 0),
(3, 36, N'Kết nối ứng dụng di động', N'Theo dõi trạng thái xe, định vị, chẩn đoán lỗi qua app VinFast.', @base + 'ket-noi-bluetooth.jpg', 1),
(3, 36, N'Cổng USB sạc điện thoại', N'Cổng sạc tiện lợi, luôn giữ pin điện thoại đầy khi di chuyển.', @base + 'cong-usb.jpg', 2),
(4, 36, N'Phanh CBS an toàn', N'Phanh đĩa trước, tang trống sau, tích hợp CBS giúp phanh ổn định.', @base + 'phanh-dia-abs.jpg', 0),
(4, 36, N'Hệ thống chống trộm thông minh', N'Khóa từ, cảnh báo chống trộm và định vị GPS, an tâm gửi xe.', @base + 'chong-trom-co.jpg', 1),
(4, 36, N'Lốp không săm 12 inch', N'Lốp 90/90-12 trước, 100/90-10 sau không săm, bám đường tốt.', @base + 'lop-khong-sam.jpg', 2);

-- SẢN PHẨM 37: Kawasaki Ninja 400
-- ============================================================
-- ============================================================
INSERT INTO Features (feature_group_id, product_id, Name, Description, image_url, display_order) VALUES
(1, 37, N'Thiết kế sportbike đầy đặn', N'Ninja 400 thừa hưởng phong cách từ ZX-10R với mặt nạ đôi sắc lạnh, bình xăng cơ bắp, yên xe thể thao và đuôi vuốt cao.', @base + 'tem-xe.jpg', 0),
(1, 37, N'Đồng hồ analog kết hợp LCD', N'Đồng hồ vòng tua analog lớn, màn hình LCD hiển thị tốc độ, mức xăng, hành trình, đồng hồ và đèn báo sang số.', @base + 'dong-ho-analog.jpg', 1),
(1, 37, N'Đèn pha LED và đèn hậu LED', N'Toàn bộ hệ thống chiếu sáng LED, sắc nét và tiết kiệm năng lượng.', @base + 'den-pha-led.jpg', 2),
(2, 37, N'Động cơ 399cc xy-lanh đôi DOHC', N'Khối động cơ 2 xy-lanh song song, 399cc, làm mát bằng chất lỏng, 8 van DOHC. Công suất 45 mã lực tại 10.000 vòng/phút, mô-men xoắn 38 Nm tại 8.000 vòng/phút. Hộp số 6 cấp, ly hợp chống trượt Assist & Slipper, bướm ga kép 32mm với phun xăng điện tử Keihin, vận hành mượt mà, thân thiện với người mới chơi.', @base + 'dong-co-phan-khoi-lon.jpg', 0),
(2, 37, N'Ly hợp chống trượt Assist & Slipper', N'Giảm lực kéo phanh động cơ khi dồn số gấp, chống bó bánh sau, tăng an toàn và ổn định khi vào cua.', @base + 'ly-hop.jpg', 1),
(3, 37, N'Bình xăng 14 lít', N'Dung tích lớn cho những chuyến đi xa, tiết kiệm thời gian dừng đổ xăng.', @base + 'binh-xang-giua.jpg', 0),
(3, 37, N'Yên xe hai tầng thoải mái', N'Yên sau có thể tháo rời, tạo dáng thể thao, vị trí ngồi thoải mái cho cả người lái và hành khách.', @base + 'yen-da.jpg', 1),
(3, 37, N'Cốp nhỏ dưới yên', N'Đủ chứa giấy tờ và bộ đồ nghề sửa chữa cơ bản.', @base + 'cop-nho.jpg', 2),
(4, 37, N'Phanh đĩa ABS Nissin', N'Phanh đĩa bánh trước 310mm kẹp 2 piston, bánh sau 220mm kẹp 2 piston, ABS 2 kênh tiêu chuẩn.', @base + 'phanh-dia-abs.jpg', 0),
(4, 37, N'Giảm xóc trước ống lồng và Monoshock sau', N'Giảm xóc trước 41mm, giảm xóc sau Uni-Trak 5 cấp điều chỉnh tải trước, ổn định khi vào cua.', @base + 'giam-xoc-tru-doi.jpg', 1),
(4, 37, N'Lốp thể thao Dunlop', N'Lốp trước 110/70R17, sau 150/60R17 không săm, bám đường tốt trong mọi điều kiện.', @base + 'lop-khong-sam.jpg', 2);

-- SẢN PHẨM 38: Ducati Panigale
-- ============================================================
-- ============================================================
INSERT INTO Features (feature_group_id, product_id, Name, Description, image_url, display_order) VALUES
(1, 38, N'Thiết kế siêu xe đỉnh cao', N'Panigale sở hữu dàn áo khí động học tuyệt mỹ, đèn pha LED sắc lạnh, bình xăng ôm sát thân và đuôi xe đơn sắc nét.', @base + 'tem-xe.jpg', 0),
(1, 38, N'Đồng hồ TFT màu 5 inch', N'Màn hình TFT màu sắc nét, hiển thị đầy đủ thông số: tốc độ, vòng tua, chế độ lái, kiểm soát lực kéo, bản đồ dẫn đường.', @base + 'dong-ho-tft.jpg', 1),
(1, 38, N'Đèn hậu LED thiết kế ẩn', N'Đèn hậu LED dạng dải mỏng tích hợp vào đuôi xe, xi-nhan LED gọn gàng.', @base + 'den-hau-led.jpg', 2),
(2, 38, N'Động cơ V4 1103cc Desmosedici Stradale', N'Khối động cơ V4 90°, dung tích 1.103cc, làm mát bằng chất lỏng, 16 van Desmodromic. Công suất 214 mã lực tại 13.000 vòng/phút, mô-men xoắn 124 Nm tại 9.500 vòng/phút. Hộp số 6 cấp với Ducati Quick Shift (DQS) lên/xuống số nhanh, ống xả Akrapovic titan (tùy chọn) cho âm thanh đua đầy uy lực.', @base + 'dong-co-phan-khoi-lon.jpg', 0),
(2, 38, N'Công nghệ Ducati Quick Shift và kiểm soát trượt', N'Hệ thống sang số nhanh hai chiều DQS cho phép sang số không cần cắt ga hoặc bóp côn, kết hợp Ducati Traction Control EVO 2 và Ducati Slide Control giúp kiểm soát độ trượt khi tăng tốc.', @base + 'cong-nghe-dac-biet.jpg', 1),
(3, 38, N'Kết nối Ducati Data Analyser+', N'Hệ thống thu thập dữ liệu đường đua, phân tích thời gian vòng, góc nghiêng, ga, phanh.', @base + 'ket-noi-bluetooth.jpg', 0),
(3, 38, N'Màn hình TFT điều khiển đa chế độ', N'Chọn chế độ lái (Race, Sport, Street), tùy chỉnh can thiệp điện tử ngay trên màn hình.', @base + 'dong-ho-tft.jpg', 1),
(3, 38, N'Bình xăng 17 lít', N'Đáp ứng nhu cầu chạy trackday hoặc di chuyển đường dài.', @base + 'binh-xang-giua.jpg', 2),
(4, 38, N'Phanh Brembo Stylema với ABS Cornering', N'Phanh đĩa kép 330mm kẹp Brembo Stylema 4 piston, đĩa sau 245mm, ABS Cornering EVO.', @base + 'phanh-dia-abs.jpg', 0),
(4, 38, N'Kiểm soát lực kéo, chống bốc đầu, drift', N'Ducati Traction Control EVO 2, Ducati Wheelie Control EVO, Ducati Slide Control, kiểm soát toàn diện.', @base + 'cong-nghe-dac-biet.jpg', 1),
(4, 38, N'Lốp Pirelli Diablo Supercorsa SP', N'Lốp 120/70ZR17 trước, 200/60ZR17 sau, gai lốp thiết kế cho độ bám tối đa trên đường đua.', @base + 'lop-khong-sam.jpg', 2);

-- SẢN PHẨM 39: BMW S1000RR
-- ============================================================
-- ============================================================
INSERT INTO Features (feature_group_id, product_id, Name, Description, image_url, display_order) VALUES
(1, 39, N'Thiết kế "cá mập" bất đối xứng', N'S1000RR nổi tiếng với cặp đèn pha bất đối xứng, dàn áo khí động học sắc lạnh, cánh gió M và màu sơn Motorsport.', @base + 'tem-xe.jpg', 0),
(1, 39, N'Đồng hồ TFT màu 6,5 inch', N'Màn hình TFT cực lớn, hiển thị đầy đủ thông số, chế độ lái, kiểm soát độ bám, dẫn đường, kết nối điện thoại.', @base + 'dong-ho-tft.jpg', 1),
(1, 39, N'Đèn hậu LED gọn gàng', N'Đèn hậu LED dạng dải mỏng, xi-nhan LED tích hợp, tăng tính khí động học.', @base + 'den-hau-led.jpg', 2),
(2, 39, N'Động cơ 4 xy-lanh thẳng hàng 999cc ShiftCam', N'Khối động cơ 4 xy-lanh, 999cc, làm mát bằng chất lỏng, 16 van DOHC, công nghệ ShiftCam biến thiên van nạp. Công suất 207 mã lực tại 13.500 vòng/phút, mô-men xoắn 113 Nm tại 11.000 vòng/phút. Hộp số 6 cấp với sang số nhanh 2 chiều, hệ thống xả titan Akrapovic nhẹ, âm thanh đặc trưng.', @base + 'dong-co-phan-khoi-lon.jpg', 0),
(2, 39, N'Công nghệ ShiftCam và sang số nhanh', N'ShiftCam thay đổi biên dạng van nạp theo vòng tua, tối ưu công suất. Sang số nhanh hai chiều cho phép lên/xuống số không cần côn.', @base + 'cong-nghe-dac-biet.jpg', 1),
(3, 39, N'Kết nối BMW Motorrad Connectivity', N'Kết nối Bluetooth với điện thoại, hiển thị cuộc gọi, nhạc, dẫn đường từng chặng trên màn hình TFT.', @base + 'ket-noi-bluetooth.jpg', 0),
(3, 39, N'Chế độ lái Rain, Road, Dynamic, Race', N'4 chế độ lái thay đổi can thiệp điện tử, phù hợp từ đi mưa đến đua track.', @base + 'cong-nghe-dac-biet.jpg', 1),
(3, 39, N'Bình xăng 16,5 lít', N'Đủ cho những chặng đua hoặc tour đường dài.', @base + 'binh-xang-giua.jpg', 2),
(4, 39, N'Phanh BMW Motorrad ABS Pro', N'ABS Cornering tối ưu phanh khi nghiêng, phanh đĩa kép 320mm kẹp 4 piston, đĩa sau 220mm.', @base + 'phanh-dia-abs.jpg', 0),
(4, 39, N'Kiểm soát lực kéo động DTC', N'Dynamic Traction Control nhiều cấp độ, chống bốc đầu, hỗ trợ xuất phát (Launch Control).', @base + 'cong-nghe-dac-biet.jpg', 1),
(4, 39, N'Lốp thể thao Metzeler Racetec RR', N'Lốp 120/70ZR17 trước, 190/55ZR17 sau, bám đường cực đỉnh ở nhiệt độ cao.', @base + 'lop-khong-sam.jpg', 2);

-- SẢN PHẨM 40: KTM RC390
-- ============================================================
-- ============================================================
INSERT INTO Features (feature_group_id, product_id, Name, Description, image_url, display_order) VALUES
(1, 40, N'Thiết kế sportbike góc cạnh', N'RC390 mang kiểu dáng xe đua thực thụ với dàn áo sắc cạnh, kính chắn gió cao, mặt nạ đèn pha LED đôi dữ dằn và khung sườn màu cam.', @base + 'tem-xe.jpg', 0),
(1, 40, N'Đồng hồ TFT màu 5 inch', N'Màn hình TFT màu sắc nét, hiển thị vòng tua, tốc độ, chế độ lái, ABS, kết nối điện thoại.', @base + 'dong-ho-tft.jpg', 1),
(1, 40, N'Đèn hậu LED dạng dải mỏng', N'Cụm đèn hậu LED thiết kế tối giản, xi-nhan LED gọn gàng.', @base + 'den-hau-led.jpg', 2),
(2, 40, N'Động cơ 373cc xy-lanh đơn DOHC', N'Khối động cơ 373,2cc, xy-lanh đơn, 4 van DOHC, làm mát bằng chất lỏng. Công suất 44 mã lực, mô-men xoắn 37 Nm. Hộp số 6 cấp với ly hợp chống trượt, bướm ga điện tử Ride-by-Wire. Hệ thống phun xăng điện tử Bosch EFI cho hiệu suất đốt cháy tối ưu.', @base + 'dong-co-phan-khoi-lon.jpg', 0),
(2, 40, N'Ride-by-Wire và chế độ lái', N'Bướm ga điện tử kết hợp chế độ lái (Street, Rain), điều chỉnh phản ứng ga và can thiệp ABS, MTC.', @base + 'cong-nghe-dac-biet.jpg', 1),
(3, 40, N'Kết nối KTM My Ride', N'Điều khiển nhạc, hiển thị cuộc gọi, dẫn đường qua Bluetooth trên màn hình TFT.', @base + 'ket-noi-bluetooth.jpg', 0),
(3, 40, N'Cốp nhỏ dưới yên', N'Đủ chứa giấy tờ, dụng cụ cơ bản.', @base + 'cop-nho.jpg', 1),
(3, 40, N'Bình xăng 13,7 lít', N'Phù hợp cho các buổi chạy track hoặc đi phượt.', @base + 'binh-xang-giua.jpg', 2),
(4, 40, N'Phanh đĩa ABS Bybre', N'Phanh đĩa 320mm trước kẹp Bybre 4 piston, đĩa 230mm sau, ABS 2 kênh có thể tắt bánh sau.', @base + 'phanh-dia-abs.jpg', 0),
(4, 40, N'Giảm xóc WP APEX USD', N'Giảm xóc trước hành trình ngược 43mm có điều chỉnh, giảm xóc sau Monoshock WP điều chỉnh tải trước.', @base + 'giam-xoc-tru-doi.jpg', 1),
(4, 40, N'Lốp Metzeler Sportec M9 RR', N'Lốp 110/70ZR17 trước, 150/60ZR17 sau, cho độ bám cao khi ôm cua.', @base + 'lop-khong-sam.jpg', 2);

-- SẢN PHẨM 41: Vespa GTS
-- ============================================================
-- ============================================================
INSERT INTO Features (feature_group_id, product_id, Name, Description, image_url, display_order) VALUES
(1, 41, N'Thiết kế thân lớn cao cấp', N'GTS giữ nguyên thân thép liền khối monocoque, to bản hơn với mặt nạ mạ chrome, đèn pha LED tròn, yên da sang trọng.', @base + 'tem-xe.jpg', 0),
(1, 41, N'Đồng hồ analog kết hợp LCD', N'Bảng đồng hồ thiết kế tròn cổ điển, mặt analog tốc độ, màn hình LCD hiển thị xăng, trip, đồng hồ, nhiệt độ.', @base + 'dong-ho-analog.jpg', 1),
(1, 41, N'Đèn hậu LED hiện đại', N'Đèn hậu LED hình thang mềm mại, xi-nhan tách rời, tăng vẻ sang trọng.', @base + 'den-hau-led.jpg', 2),
(2, 41, N'Động cơ HPE 300cc làm mát dung dịch', N'Khối động cơ 278cc, xy-lanh đơn, 4 kỳ, 4 van, làm mát bằng chất lỏng. Công suất 23,8 mã lực tại 8.250 vòng/phút, mô-men xoắn 26 Nm tại 5.250 vòng/phút. Mạnh mẽ nhất dòng Vespa, tăng tốc nhanh, vận hành êm, phun xăng điện tử Piaggio, tiết kiệm nhiên liệu.', @base + 'dong-co-xe-so-ga.jpg', 0),
(2, 41, N'Công nghệ phun xăng điện tử PI', N'Hệ thống phun xăng điện tử Piaggio với cảm biến nhiệt độ và áp suất khí nạp, tối ưu hóa tỉ lệ hòa khí.', @base + 'cong-nghe-dac-biet.jpg', 1),
(3, 41, N'Cốp rộng rãi', N'Dung tích cốp lớn, chứa được mũ bảo hiểm full-face và đồ dùng cá nhân.', @base + 'cop-lon.jpg', 0),
(3, 41, N'Khóa từ chống trộm Immobilizer', N'Chip mã hóa chống sao chép chìa, bảo vệ xe tối ưu.', @base + 'chong-trom-co.jpg', 1),
(3, 41, N'Bình xăng 8,5 lít', N'Dung tích lớn, di chuyển đường dài không lo hết xăng.', @base + 'nap-xang-truoc.jpg', 2),
(4, 41, N'Phanh đĩa trước/sau với ABS', N'Phanh đĩa thủy lực 220mm cả hai bánh, ABS 2 kênh tiêu chuẩn.', @base + 'phanh-dia-abs.jpg', 0),
(4, 41, N'Hệ thống treo liên kết đơn trước', N'Giảm xóc trước single arm đặc trưng, giảm xóc sau lò xo trụ đôi với 4 cấp điều chỉnh tải trọng.', @base + 'giam-xoc-tru-doi.jpg', 1),
(4, 41, N'Lốp không săm 12 inch', N'Lốp trước 120/70-12, sau 130/70-12 không săm, độ bám và ổn định cao.', @base + 'lop-khong-sam.jpg', 2);

-- SẢN PHẨM 42: Honda Scoopy
-- ============================================================
-- ============================================================
INSERT INTO Features (feature_group_id, product_id, Name, Description, image_url, display_order) VALUES
(1, 42, N'Thiết kế tròn trịa dễ thương', N'Scoopy mang phong cách retro nhập khẩu từ Thái Lan với thân xe tròn như cục kẹo, đèn pha LED tròn lớn, yên xe thấp và màu pastel.', @base + 'tem-xe.jpg', 0),
(1, 42, N'Đồng hồ LCD kết hợp analog', N'Bảng đồng hồ vừa có mặt analog tốc độ, vừa có màn hình LCD hiển thị xăng, trip, đồng hồ.', @base + 'dong-ho-lcd.jpg', 1),
(1, 42, N'Đèn hậu LED tròn cách điệu', N'Cụm đèn hậu LED hình tròn, xi-nhan tách rời, tăng vẻ dễ thương.', @base + 'den-hau-led.jpg', 2),
(2, 42, N'Động cơ eSP 110cc làm mát bằng gió', N'Khối động cơ 109,5cc, xy-lanh đơn, 4 kỳ, làm mát bằng gió, công nghệ eSP. Công suất 6,6 kW, mô-men xoắn 9,3 Nm. Vận hành êm ái, tiết kiệm xăng (khoảng 1,7 lít/100km), khởi động ACG không tiếng ồn.', @base + 'dong-co-xe-so-ga.jpg', 0),
(3, 42, N'Cốp U-box rộng 15,4 lít', N'Cốp chứa vừa mũ bảo hiểm 3/4 và đồ dùng cá nhân, mở bằng nút bấm trên tay lái.', @base + 'cop-nho.jpg', 0),
(3, 42, N'Cổng sạc USB trong hộc đồ', N'Cổng sạc 12W tiện lợi, sạc điện thoại nhanh chóng.', @base + 'cong-usb.jpg', 1),
(3, 42, N'Hệ thống khóa thông minh Smartkey', N'Smartkey Honda thế hệ mới, mở khóa, tìm xe từ xa.', @base + 'smartkey.jpg', 2),
(4, 42, N'Phanh CBS kết hợp', N'Phanh đĩa thủy lực trước và phanh tang trống sau, hệ thống CBS phân bổ lực phanh.', @base + 'phanh-dia-abs.jpg', 0),
(4, 42, N'Giảm xóc trước ống lồng, sau lò xo trụ đơn', N'Giảm xóc sau có 3 cấp điều chỉnh, êm ái trên đường phố.', @base + 'giam-xoc-tru-doi.jpg', 1),
(4, 42, N'Lốp không săm 12 inch', N'Lốp trước 100/90-12, sau 110/90-12 không săm, bám đường và an toàn.', @base + 'lop-khong-sam.jpg', 2);

-- SẢN PHẨM 43: Yamaha Latte
-- ============================================================
-- ============================================================
INSERT INTO Features (feature_group_id, product_id, Name, Description, image_url, display_order) VALUES
(1, 43, N'Thiết kế nữ tính, mềm mại', N'Latte được thiết kế dành riêng cho phái nữ với thân xe thon gọn, đèn pha LED hình bầu dục, yên xe thấp (760 mm) và tem xe thanh lịch.', @base + 'tem-xe.jpg', 0),
(1, 43, N'Đồng hồ LCD hiện đại', N'Màn hình LCD hiển thị tốc độ, mức xăng, hành trình, đồng hồ, đèn báo Stop & Start.', @base + 'dong-ho-lcd.jpg', 1),
(1, 43, N'Đèn hậu LED dạng cánh', N'Cụm đèn hậu LED mềm mại, xi-nhan tách rời, tăng nét nữ tính.', @base + 'den-hau-led.jpg', 2),
(2, 43, N'Động cơ Blue Core 125cc Stop & Start', N'Khối động cơ 125cc, xy-lanh đơn, 4 kỳ, làm mát bằng gió cưỡng bức, công nghệ Blue Core và Stop & Start. Công suất 6,1 kW, mô-men xoắn 9,7 Nm. Tiết kiệm nhiên liệu (1,69 lít/100km), khởi động lại êm ái, giảm phát thải CO2.', @base + 'dong-co-xe-so-ga.jpg', 0),
(3, 43, N'Cốp rộng 37 lít', N'Dung tích cốp cực lớn, chứa được hai mũ bảo hiểm nửa đầu và đồ đạc, đứng đầu phân khúc.', @base + 'cop-lon.jpg', 0),
(3, 43, N'Nắp bình xăng tiện lợi phía trước', N'Không cần xuống xe khi đổ xăng, nắp mở ngay mặt nạ trước, rất phù hợp với phụ nữ.', @base + 'nap-xang-truoc.jpg', 1),
(3, 43, N'Khóa thông minh Smartkey', N'Smartkey Yamaha cho phép mở khóa, tìm xe, mở cốp từ xa.', @base + 'smartkey.jpg', 2),
(4, 43, N'Phanh CBS kết hợp', N'Phanh đĩa thủy lực trước và phanh tang trống sau, CBS phân phối lực phanh an toàn.', @base + 'phanh-dia-abs.jpg', 0),
(4, 43, N'Giảm xóc sau lò xo trụ đôi', N'Giảm xóc sau có 3 cấp điều chỉnh tải trọng, êm ái khi chở thêm người.', @base + 'giam-xoc-tru-doi.jpg', 1),
(4, 43, N'Lốp không săm 14 inch', N'Lốp trước 90/80-14, sau 100/80-14 không săm, ổn định và an toàn.', @base + 'lop-khong-sam.jpg', 2);

-- SẢN PHẨM 44: Honda Dream
-- ============================================================
-- ============================================================
INSERT INTO Features (feature_group_id, product_id, Name, Description, image_url, display_order) VALUES
(1, 44, N'Huyền thoại xe số cổ điển', N'Dream mang thiết kế vuông vức đặc trưng của thập niên 90, mặt nạ đơn giản, yên xe dài và thấp, gợi nhớ một thời vàng son.', @base + 'tem-xe.jpg', 0),
(1, 44, N'Đồng hồ cơ truyền thống', N'Bảng đồng hồ dạng analog với mặt số tốc độ lớn, đèn báo xăng và xi-nhan.', @base + 'dong-ho-analog.jpg', 1),
(1, 44, N'Đèn pha tròn cổ điển', N'Đèn pha tròn halogen ánh sáng vàng ấm, dễ thay thế, phụ tùng phổ biến.', @base + 'den-pha-led.jpg', 2),
(2, 44, N'Động cơ 100cc siêu bền', N'Khối động cơ 97,1cc, xy-lanh đơn, 4 kỳ, làm mát bằng gió, phun xăng điện tử Fi. Công suất 5,4 kW, mô-men xoắn 7,2 Nm. Nổi tiếng với độ bền "thách thức thời gian", tiết kiệm xăng vượt trội (1,5 lít/100km).', @base + 'dong-co-xe-so-ga.jpg', 0),
(3, 44, N'Cốp nhỏ dưới yên', N'Cốp chứa được áo mưa và giấy tờ, đủ cho nhu cầu cơ bản.', @base + 'cop-nho.jpg', 0),
(3, 44, N'Móc treo đồ tiện lợi', N'Móc treo phía trước chắc chắn, hữu ích khi đi chợ.', @base + 'moc-treo.jpg', 1),
(3, 44, N'Khóa cơ đa năng', N'Ổ khóa tích hợp khóa từ, khóa cổ, bền bỉ.', @base + 'chong-trom-co.jpg', 2),
(4, 44, N'Phanh tang trống trước/sau', N'Phanh cơ tang trống cho lực phanh vừa đủ, dễ sửa chữa, chi phí thấp.', @base + 'phanh-dia-abs.jpg', 0),
(4, 44, N'Giảm xóc trước ống lồng thủy lực', N'Giảm xóc trước hành trình dài, hấp thụ xóc tốt.', @base + 'giam-xoc-tru-doi.jpg', 1),
(4, 44, N'Lốp có săm truyền thống', N'Lốp 2.50-17 trước, 2.75-17 sau có săm, dễ vá, giá rẻ.', @base + 'lop-khong-sam.jpg', 2);

-- SẢN PHẨM 45: KTM Duke 200
-- ============================================================
-- ============================================================
INSERT INTO Features (feature_group_id, product_id, Name, Description, image_url, display_order) VALUES
(1, 45, N'Thiết kế naked-bike góc cạnh', N'Duke 200 mang ngôn ngữ "Ready to Race" với đèn pha LED đôi sắc lạnh, bình xăng cắt xẻ, khung sườn cam nổi bật.', @base + 'tem-xe.jpg', 0),
(1, 45, N'Đồng hồ LCD toàn phần', N'Màn hình LCD âm bản hiển thị tốc độ, vòng tua, mức xăng, trip, đồng hồ và đèn báo ABS.', @base + 'dong-ho-lcd.jpg', 1),
(1, 45, N'Đèn hậu LED thể thao', N'Cụm đèn hậu LED dạng dải, xi-nhan LED gọn gàng, phong cách thể thao.', @base + 'den-hau-led.jpg', 2),
(2, 45, N'Động cơ 199,5cc xy-lanh đơn DOHC', N'Khối động cơ 199,5cc, xy-lanh đơn, 4 van DOHC, làm mát bằng chất lỏng. Công suất 25 mã lực tại 10.000 vòng/phút, mô-men xoắn 19,3 Nm tại 8.000 vòng/phút. Hộp số 6 cấp, ly hợp chống trượt, phun xăng điện tử Bosch, vận hành linh hoạt trong phố.', @base + 'dong-co-phan-khoi-lon.jpg', 0),
(3, 45, N'Bình xăng 13,4 lít', N'Dung tích lớn cho phép di chuyển xa mà không lo hết xăng.', @base + 'binh-xang-giua.jpg', 0),
(3, 45, N'Yên xe thể thao thoải mái', N'Độ cao yên 822 mm, phù hợp vóc dáng người Việt, tư thế lái chủ động.', @base + 'yen-da.jpg', 1),
(3, 45, N'Đèn LED toàn bộ', N'Hệ thống chiếu sáng LED tiết kiệm năng lượng và bền bỉ.', @base + 'den-pha-led.jpg', 2),
(4, 45, N'Phanh đĩa ABS Bybre', N'Phanh đĩa 300mm trước kẹp Bybre 4 piston, đĩa 230mm sau, ABS 2 kênh.', @base + 'phanh-dia-abs.jpg', 0),
(4, 45, N'Giảm xóc WP APEX USD', N'Giảm xóc trước hành trình ngược 43mm, giảm xóc sau WP Monoshock 10 cấp điều chỉnh.', @base + 'giam-xoc-tru-doi.jpg', 1),
(4, 45, N'Lốp thể thao không săm', N'Lốp 110/70ZR17 trước, 150/60ZR17 sau MRF Revz, bám đường tốt.', @base + 'lop-khong-sam.jpg', 2);

-- SẢN PHẨM 46: BMW G310GS
-- ============================================================
-- ============================================================
INSERT INTO Features (feature_group_id, product_id, Name, Description, image_url, display_order) VALUES
(1, 46, N'Thiết kế adventure cỡ nhỏ', N'G310GS thừa hưởng DNA từ dòng GS với mỏ vịt trước, kính chắn gió cao, ghi-đông rộng và thân xe gọn gàng.', @base + 'tem-xe.jpg', 0),
(1, 46, N'Đồng hồ LCD toàn phần', N'Màn hình LCD hiển thị tốc độ, vòng tua, mức xăng, trip, đồng hồ, nhiệt độ máy.', @base + 'dong-ho-lcd.jpg', 1),
(1, 46, N'Đèn pha LED hiện đại', N'Đèn pha LED sáng rõ, đèn định vị LED tăng khả năng nhận diện.', @base + 'den-pha-led.jpg', 2),
(2, 46, N'Động cơ 313cc xy-lanh đơn làm mát dung dịch', N'Khối động cơ 313cc, xy-lanh đơn, 4 kỳ, DOHC, 4 van, làm mát bằng chất lỏng. Công suất 34 mã lực, mô-men xoắn 28 Nm. Vận hành linh hoạt trên đường nhựa và đường đất nhẹ, phun xăng điện tử BMS-E của BMW tối ưu hóa nhiên liệu.', @base + 'dong-co-phan-khoi-lon.jpg', 0),
(2, 46, N'Hệ thống phun xăng điện tử BMS-E', N'Công nghệ phun xăng điện tử BMW giúp tối ưu hóa nhiên liệu và công suất, phản ứng ga nhanh nhạy.', @base + 'cong-nghe-dac-biet.jpg', 1),
(3, 46, N'Kính chắn gió cao', N'Kính chắn gió bảo vệ người lái khỏi gió và côn trùng khi đi đường dài.', @base + 'kinh-chan-gio.jpg', 0),
(3, 46, N'Bình xăng 11 lít', N'Đủ cho những chuyến phiêu lưu ngắn ngày.', @base + 'binh-xang-giua.jpg', 1),
(3, 46, N'Yên xe êm ái', N'Độ cao yên 835 mm, thiết kế thoải mái cho hành trình dài.', @base + 'yen-da.jpg', 2),
(4, 46, N'Phanh đĩa ABS Bybre', N'Phanh đĩa trước 300mm, sau 240mm, ABS 2 kênh có thể tắt cho bánh sau khi đi off-road.', @base + 'phanh-dia-abs.jpg', 0),
(4, 46, N'Giảm xóc USD trước và Monoshock sau', N'Giảm xóc trước hành trình ngược 41mm, giảm xóc sau điều chỉnh tải trước, hành trình dài 180mm.', @base + 'giam-xoc-tru-doi.jpg', 1),
(4, 46, N'Lốp đa địa hình', N'Lốp 110/80R19 trước, 150/70R17 sau Metzeler Tourance, bám tốt trên đường trường và đường đất.', @base + 'lop-khong-sam.jpg', 2);

-- SẢN PHẨM 47: Kawasaki Versys
-- ============================================================
-- ============================================================
INSERT INTO Features (feature_group_id, product_id, Name, Description, image_url, display_order) VALUES
(1, 47, N'Thiết kế adventure touring', N'Versys mang dáng vẻ bệ vệ với kính chắn gió lớn điều chỉnh được, mặt nạ đèn pha LED đôi, bình xăng to và tư thế ngồi thẳng.', @base + 'tem-xe.jpg', 0),
(1, 47, N'Đồng hồ TFT màu 4,3 inch', N'Màn hình TFT màu sắc nét, hiển thị đầy đủ thông số, kết nối điện thoại qua Rideology.', @base + 'dong-ho-tft.jpg', 1),
(1, 47, N'Đèn hậu LED sắc sảo', N'Cụm đèn hậu LED và xi-nhan tách rời, tăng tính hiện đại.', @base + 'den-hau-led.jpg', 2),
(2, 47, N'Động cơ 649cc xy-lanh đôi DOHC', N'Khối động cơ 2 xy-lanh song song, 649cc, làm mát bằng chất lỏng, 8 van DOHC. Công suất 67 mã lực, mô-men xoắn 64 Nm. Vận hành êm ái, mượt mà, phù hợp đường trường, hộp số 6 cấp.', @base + 'dong-co-phan-khoi-lon.jpg', 0),
(3, 47, N'Kính chắn gió điều chỉnh 4 cấp', N'Dễ dàng thay đổi độ cao kính chắn gió mà không cần dụng cụ, tối ưu bảo vệ khi đi xa.', @base + 'kinh-chan-gio.jpg', 0),
(3, 47, N'Bình xăng 21 lít', N'Dung tích cực lớn cho phép di chuyển hơn 400 km mà không cần đổ xăng.', @base + 'binh-xang-giua.jpg', 1),
(3, 47, N'Kết nối Kawasaki Rideology', N'Ứng dụng trên điện thoại hiển thị thông tin xe, ghi lại hành trình, bảo dưỡng.', @base + 'ket-noi-bluetooth.jpg', 2),
(4, 47, N'Phanh đĩa ABS Nissin', N'Phanh đĩa kép 300mm trước kẹp 2 piston, đĩa 250mm sau, ABS 2 kênh.', @base + 'phanh-dia-abs.jpg', 0),
(4, 47, N'Giảm xóc trước ống lồng, sau Monoshock', N'Giảm xóc trước 41mm, giảm xóc sau Uni-Trak có điều chỉnh tải trước và hồi phục.', @base + 'giam-xoc-tru-doi.jpg', 1),
(4, 47, N'Lốp touring đa năng', N'Lốp 120/70ZR17 trước, 160/60ZR17 sau, bám đường tốt và bền bỉ.', @base + 'lop-khong-sam.jpg', 2);

-- SẢN PHẨM 48: Lambretta V200
-- ============================================================
-- ============================================================
INSERT INTO Features (feature_group_id, product_id, Name, Description, image_url, display_order) VALUES
(1, 48, N'Thiết kế cổ điển Ý vuông vức', N'V200 mang phong cách retro đặc trưng với thân xe vuông, đèn pha LED vuông, yên xe bọc da cao cấp và tay lái mạ chrome.', @base + 'tem-xe.jpg', 0),
(1, 48, N'Đồng hồ LCD toàn phần', N'Màn hình LCD hiển thị tốc độ, mức xăng, trip, đồng hồ, giao diện hiện đại pha cổ điển.', @base + 'dong-ho-lcd.jpg', 1),
(1, 48, N'Đèn hậu LED thiết kế độc đáo', N'Cụm đèn hậu LED hình chữ nhật bo góc, xi-nhan LED tách rời.', @base + 'den-hau-led.jpg', 2),
(2, 48, N'Động cơ 169cc làm mát bằng dung dịch', N'Khối động cơ 168,9cc, xy-lanh đơn, 4 kỳ, làm mát bằng chất lỏng. Công suất 8,7 kW, mô-men xoắn 12,2 Nm. Vận hành mạnh mẽ, êm ái, phun xăng điện tử, tiêu hao nhiên liệu khoảng 2,4 lít/100km.', @base + 'dong-co-xe-so-ga.jpg', 0),
(3, 48, N'Cốp rộng rãi', N'Dung tích cốp lớn, chứa được mũ bảo hiểm full-face và đồ dùng.', @base + 'cop-lon.jpg', 0),
(3, 48, N'Sàn phẳng để chân', N'Sàn phẳng rộng, tiện đặt thêm hành lý.', @base + 'san-chan-phang.jpg', 1),
(3, 48, N'Khóa từ chống trộm', N'Ổ khóa tích hợp chip Immobilizer, an toàn cao.', @base + 'chong-trom-co.jpg', 2),
(4, 48, N'Phanh đĩa trước/sau ABS', N'Phanh đĩa thủy lực cả hai bánh, ABS 2 kênh, an toàn tối đa.', @base + 'phanh-dia-abs.jpg', 0),
(4, 48, N'Giảm xóc sau lò xo trụ đôi', N'Giảm xóc sau điều chỉnh tải trọng, êm ái trên mọi cung đường.', @base + 'giam-xoc-tru-doi.jpg', 1),
(4, 48, N'Lốp không săm 12 inch', N'Lốp 110/90-12 trước, 120/90-12 sau, bám đường và ổn định.', @base + 'lop-khong-sam.jpg', 2);

-- SẢN PHẨM 49: Honda ADV160
-- ============================================================
-- ============================================================
INSERT INTO Features (feature_group_id, product_id, Name, Description, image_url, display_order) VALUES
(1, 49, N'Thiết kế adventure cứng cáp', N'ADV160 mang phong cách xe địa hình với mặt nạ góc cạnh, kính chắn gió điều chỉnh được, lốp gai và gầm cao.', @base + 'tem-xe.jpg', 0),
(1, 49, N'Đồng hồ LCD toàn phần', N'Màn hình LCD hiển thị tốc độ, mức xăng, hành trình, đồng hồ, đèn báo ABS và HSTC.', @base + 'dong-ho-lcd.jpg', 1),
(1, 49, N'Đèn hậu LED hình chữ X', N'Cụm đèn hậu LED thiết kế đặc trưng, xi-nhan tách rời, tăng vẻ mạnh mẽ.', @base + 'den-hau-led.jpg', 2),
(2, 49, N'Động cơ eSP+ 160cc làm mát dung dịch', N'Khối động cơ 156,9cc, xy-lanh đơn, 4 kỳ, 4 van, làm mát bằng chất lỏng. Công suất 11,8 kW, mô-men xoắn 14,7 Nm. Tích hợp công nghệ kiểm soát lực kéo HSTC (Honda Selectable Torque Control) giúp chống trượt bánh sau khi tăng ga đột ngột trên đường trơn. Tiêu hao nhiên liệu khoảng 2,3 lít/100km.', @base + 'dong-co-xe-so-ga.jpg', 0),
(2, 49, N'Công nghệ HSTC kiểm soát lực kéo', N'HSTC theo dõi tốc độ bánh trước và sau, khi phát hiện trượt sẽ tự động giảm mô-men xoắn động cơ, lấy lại độ bám, đặc biệt hữu ích trên đường ướt hoặc sỏi đá.', @base + 'cong-nghe-dac-biet.jpg', 1),
(3, 49, N'Cốp rộng 28 lít', N'Dung tích lớn, chứa được mũ bảo hiểm full-face và đồ dùng cá nhân.', @base + 'cop-lon.jpg', 0),
(3, 49, N'Kính chắn gió điều chỉnh 2 cấp', N'Dễ dàng thay đổi độ cao kính chắn gió, tăng thoải mái khi đi xa.', @base + 'kinh-chan-gio.jpg', 1),
(3, 49, N'Hệ thống khóa thông minh Smartkey', N'Smartkey Honda, mở khóa, tìm xe, mở cốp từ xa, tiện lợi và an toàn.', @base + 'smartkey.jpg', 2),
(4, 49, N'Phanh đĩa ABS trước/sau', N'Phanh đĩa thủy lực cả hai bánh, ABS 2 kênh, an toàn khi phanh trên đường trơn.', @base + 'phanh-dia-abs.jpg', 0),
(4, 49, N'Giảm xóc Showa phía trước, lò xo trụ đôi sau', N'Giảm xóc trước ống lồng Showa 31mm, giảm xóc sau lò xo trụ đôi điều chỉnh tải trọng, hành trình dài.', @base + 'giam-xoc-tru-doi.jpg', 1),
(4, 49, N'Lốp gai đa địa hình', N'Lốp 110/80-14 trước, 130/70-13 sau không săm, gai lốp dạng block bám tốt trên đường đất và nhựa.', @base + 'lop-khong-sam.jpg', 2);

-- SẢN PHẨM 50: Yamaha XSR155
-- ============================================================
INSERT INTO Features (feature_group_id, product_id, Name, Description, image_url, display_order) VALUES
(1, 50, N'Thiết kế Neo-Retro cổ điển', N'XSR155 mang phong cách hoài cổ pha hiện đại với đèn pha tròn LED, bình xăng teardrop, yên da liền khối và ống xả cổ điển.', @base + 'tem-xe.jpg', 0),
(1, 50, N'Đồng hồ LCD tròn cổ điển', N'Màn hình LCD dạng tròn hiển thị tốc độ, vòng tua, mức xăng, trip, đồng hồ, giao diện vintage.', @base + 'dong-ho-lcd.jpg', 1),
(1, 50, N'Đèn hậu LED tròn', N'Đèn hậu LED tròn và xi-nhan LED tách rời, giữ đúng chất retro.', @base + 'den-hau-led.jpg', 2),
(2, 50, N'Động cơ 155cc VVA làm mát dung dịch', N'Khối động cơ 155cc, xy-lanh đơn, 4 van, SOHC, công nghệ Van biến thiên VVA, làm mát bằng chất lỏng. Công suất 14,2 kW, mô-men xoắn 13,9 Nm. Hộp số 6 cấp với ly hợp chống trượt Assist & Slipper, phun xăng điện tử Fi, vận hành mạnh mẽ và tiết kiệm.', @base + 'dong-co-phan-khoi-lon.jpg', 0),
(2, 50, N'Công nghệ VVA và ly hợp chống trượt', N'VVA thay đổi biên dạng van nạp theo vòng tua, tối ưu sức mạnh. Ly hợp chống trượt giúp sang số mượt, an toàn.', @base + 'cong-nghe-dac-biet.jpg', 1),
(3, 50, N'Cốp nhỏ dưới yên', N'Yên liền khối có thể mở để lộ cốp nhỏ chứa giấy tờ, dụng cụ.', @base + 'cop-nho.jpg', 0),
(3, 50, N'Đèn pha LED tròn cổ điển', N'Đèn pha LED tròn cho ánh sáng trắng, tiết kiệm năng lượng nhưng vẫn giữ vẻ retro.', @base + 'den-pha-led.jpg', 1),
(3, 50, N'Bình xăng 10 lít', N'Dung tích vừa đủ cho những chuyến đi khám phá phố phường.', @base + 'binh-xang-giua.jpg', 2),
(4, 50, N'Phanh đĩa ABS trước/sau', N'Phanh đĩa thủy lực đường kính 282mm trước, 220mm sau, ABS 2 kênh.', @base + 'phanh-dia-abs.jpg', 0),
(4, 50, N'Giảm xóc trước USD', N'Giảm xóc trước hành trình ngược 37mm, giảm xóc sau Monoshock, ổn định khi vào cua.', @base + 'giam-xoc-tru-doi.jpg', 1),
(4, 50, N'Lốp thể thao không săm', N'Lốp 110/70-17 trước, 140/70-17 sau, gai lốp thể thao bám đường tốt.', @base + 'lop-khong-sam.jpg', 2);
