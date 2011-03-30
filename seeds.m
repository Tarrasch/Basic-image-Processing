crisps = load_seed('img/rum_crisp');
thyrs  = load_seed('img/rum_thyrs');

% resample images
for i = 1:5
    crisps(i,:,:) = my_resample(squeeze(crisps(i,:,:)));
    thyrs(i,:,:) = my_resample(squeeze(thyrs(i,:,:)));
end

Ir = squeeze(crisps(1,:,:));
