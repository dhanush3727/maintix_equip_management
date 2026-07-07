import api from "./api/api";

export const metaService = {
  async getMeta() {
    const res = await api.get("meta");
    return res.data;
  },
};
