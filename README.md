# Useful MATLAB Scripts for NetCDF File Creation

This repository contains MATLAB functions for generating 3D and 4D NetCDF (`.nc`) files from structured arrays. These tools are especially useful for climate, meteorological, or environmental data preprocessing.

---

## 📦 Files Included

- `create_nc_hly_3d.m`  
  Creates a 3D NetCDF file with dimensions **(time, latitude, longitude)** for variables like zonal wind.

- `create_nc_hly_4d.m`  
  Creates a 4D NetCDF file with dimensions **(time, level, latitude, longitude)** for variables like relative humidity.

---

## ⚙️ Requirements

- **MATLAB** (tested on Linux)
- **CDO (Climate Data Operators)** must be installed and accessible from the command line.
  - You can install it on Debian/Ubuntu using:
    ```bash
    sudo apt install cdo
    ```

---

## 📚 Usage

```matlab
% Example usage for 3D data:
create_nc_3d(data, time, lon, lat, 'output_file.nc');

% Example usage for 4D data:
create_nc_hly_4d(data, time, level, lon, lat, 'output_file.nc');
```

> Note: The `data` arrays should be formatted as `lon x lat x time` or `lon x lat x level x time` accordingly.

---

## 🧾 License

MIT License – feel free to use and modify.

---

## 🤝 Contributing

Pull requests and suggestions are welcome! Please open an issue for bugs or feature requests.
