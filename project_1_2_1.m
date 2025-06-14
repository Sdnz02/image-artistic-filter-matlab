% Görüntüyü yükleme
img = imread('input (1).jpg'); % Görüntü dosya adı
[rows, cols, channels] = size(img);

% Başlangıç: Fırça Darbesi Efekti (Daha belirgin)
final_img = img; % Orijinal görüntüyle başla
block_size = 30; % Daha büyük fırça darbesi boyutu
num_blocks = 400; % Daha fazla rastgele blok

for i = 1:num_blocks
    % Rastgele blok seçimi
    r_start = randi([1, rows - block_size]);
    c_start = randi([1, cols - block_size]);
    r_end = min(r_start + block_size - 1, rows);
    c_end = min(c_start + block_size - 1, cols);
    
    % Blok içindeki her renk kanalının ortalamasını hesapla
    for ch = 1:channels
        block = img(r_start:r_end, c_start:c_end, ch);
        avg_val = mean(block(:));
        final_img(r_start:r_end, c_start:c_end, ch) = avg_val;
    end
end

% Kenar Çizim Efekti (Daha belirgin)
sobel_x = [-1 0 1; -2 0 2; -1 0 1];
sobel_y = [-1 -2 -1; 0 0 0; 1 2 1];
edge_img = zeros(size(img), 'uint8');

for ch = 1:channels
    channel_edge = zeros(rows, cols);
    for r = 2:rows-1
        for c = 2:cols-1
            % 3x3 pencere alımı
            window = double(img(r-1:r+1, c-1:c+1, ch));
            % Kenar tespiti
            gx = sum(sum(window .* sobel_x));
            gy = sum(sum(window .* sobel_y));
            % Kenar büyüklüğünü artır
            channel_edge(r, c) = 2 * sqrt(gx^2 + gy^2); % Daha güçlü gradient
        end
    end
    % Kenar görüntüsünü ilgili kanala ekle
    edge_img(:, :, ch) = uint8(255 * mat2gray(channel_edge));
end

% Kenar efekti ile fırça darbesi efektini birleştirme
final_img = imadd(final_img, edge_img); % Kenarları mevcut görüntüye ekle

% Fotoğraf Eskitme Efekti
noise = uint8(30 * randn(rows, cols, channels)); % Gürültü ekleme
final_img = final_img + noise; % Gürültüyü ekle

% Soluklaştırma
for ch = 1:channels
    final_img(:, :, ch) = imadjust(final_img(:, :, ch), [0.3 0.7], [0 1]);
end

% Negatif Pozitif Kombinasyonu
for r = 1:rows
    for c = 1:cols
        if c > cols / 2
            for ch = 1:channels
                final_img(r, c, ch) = 255 - final_img(r, c, ch); % Sağ yarıyı negatif yap
            end
        end
    end
end

% Sonuçları görselleştirme
figure;
subplot(1,2,1), imshow(img), title('Orijinal Görüntü');
subplot(1,2,2), imshow(final_img), title('Birleşik Efekt Sonucu (Güçlendirilmiş)');
